{
  description = "A collection of derivations for vapoursynth plugins";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";

  outputs = { self, nixpkgs, flake-utils, pre-commit-hooks }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        sources = pkgs.callPackage ./_sources/generated.nix { };
      in
      rec
      {
        packages = flake-utils.lib.flattenTree {
          vapoursynth-eedi3 = pkgs.callPackage ./pkgs/vapoursynth-plugins/eedi3 {
            inherit (sources.vapoursynth-eedi3) pname src version;
          };
          vapoursynth-bwdif = pkgs.callPackage ./pkgs/vapoursynth-plugins/bwdif {
            inherit (sources.vapoursynth-bwdif) pname src version;
          };
          vapoursynth-nnedi3 = pkgs.callPackage ./pkgs/vapoursynth-plugins/nnedi3 {
            inherit (sources.vapoursynth-nnedi3) pname src version;
          };
        };

        defaultPackage = packages.vapoursynth-eedi3;

        # Format and lint the code on a pre-commit hook.
        checks = {
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixpkgs-fmt.enable = true;
              nix-linter.enable = true;
            };
            excludes = [ "_sources" ];
          };
        };
        devShell = nixpkgs.legacyPackages.${system}.mkShell {
          inherit (self.checks.${system}.pre-commit-check) shellHook;
        };
      }
    );
}
