{pkgs, ...}: {
  devShells.rust = pkgs.mkShell {
    name = "rust";
    packages = with pkgs; [
      rust-bin.stable.latest.default
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    DIRENV_LOG_FORMAT = "";
  };
}
