{pkgs, ...}: {
  devShells.ts-pnpm-prisma = pkgs.mkShell {
    name = "ts-pnpm-prisma";
    packages = with pkgs; [
      nodePackages.pnpm
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodejs
      openssl
    ];
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    DIRENV_LOG_FORMAT = "";
    shellHook = let
      prisma-engines = pkgs.prisma-engines;
    in ''
      export PRISMA_SCHEMA_ENGINE_BINARY="${prisma-engines}/bin/schema-engine"
      export PRISMA_QUERY_ENGINE_BINARY="${prisma-engines}/bin/query-engine"
      export PRISMA_QUERY_ENGINE_LIBRARY="${prisma-engines}/lib/libquery_engine.node"
      export PRISMA_INTROSPECTION_ENGINE_BINARY="${prisma-engines}/bin/introspection-engine"
      export PRISMA_FMT_BINARY="${prisma-engines}/bin/prisma-fmt"
    '';
  };
}
