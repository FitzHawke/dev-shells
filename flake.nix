{
  description = "Personal Dev Flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };
  outputs = {
    flake-parts,
    nixpkgs,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];
      perSystem = {
        config,
	system,
        pkgs,
        ...
      }: {
        legacyPackages = import nixpkgs {
          config.allowUnfree = true;
          config.allowUnsupportedSystem = true;
          inherit system;
        };
        imports = [{_module.args.pkgs = config.legacyPackages;} ./pkgs];

        formatter = pkgs.alejandra;
      };
    };
}
