{pkgs, ...}: {
  devShells.ts-bun = pkgs.mkShell {
    name = "ts-bun";
    packages = with pkgs; [
      bun
      typescript
      typescript-language-server
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    DIRENV_LOG_FORMAT = "";
  };
}
