{pkgs, ...}: {
  devShells.ts-pnpm = pkgs.mkShell {
    name = "ts-pnpm";
    packages = with pkgs; [
      pnpm
      typescript
      typescript-language-server
      nodePackages_latest.nodejs
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    DIRENV_LOG_FORMAT = "";
  };
}
