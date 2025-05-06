{pkgs, ...}: {
  devShells.rust-base = pkgs.mkShell {
    name = "rust-base";
    packages = with pkgs; [
      rust-bin.stable.latest.default
      rust-analyzer
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    DIRENV_LOG_FORMAT = "";
  };
}
