{pkgs, ...}: {
  devShells.ts-pnpm = pkgs.mkShell {
    name = "ts-pnpm";
    packages = with pkgs; [
      nodePackages.pnpm
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodejs
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    DIRENV_LOG_FORMAT = "";
  };
}
