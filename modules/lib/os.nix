{
  isNixOS =
    let
      inherit (builtins) elem hasAttr match readDir readFile;

      dirContent = readDir /etc;
      isFile = name: hasAttr name dirContent && elem dirContent.${name} [ "regular" "symlink" ];
    in

      isFile "NIXOS"
      && (
        isFile "os-release"
        && match "(.*[[:space:]])?ID=nixos([[:space:]].*)?" (readFile /etc/os-release) != null
      );
}
