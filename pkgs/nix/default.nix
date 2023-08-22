{
  pkgs,
  inputs,
  system,
  ...
}: {
  devShells.nix-nil = pkgs.mkShell {
    name = "nix-nil";
    packages = with pkgs; [
      nix
      home-manager
      git

      nil
      alejandra

      inputs.agenix.packages.${system}.default
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes repl-flake";
    DIRENV_LOG_FORMAT = "";
  };
}
