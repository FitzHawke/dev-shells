{
  pkgs,
  ...
}: {
  devShells.git-bash = pkgs.mkShell {
    name = "git-bash";
    packages = with pkgs; [
      bash
      git
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes repl-flake";
    DIRENV_LOG_FORMAT = "";
  };
}