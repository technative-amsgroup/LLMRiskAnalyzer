{
  description = "Cloudia";

  inputs = { nixpkgs.url = "github:NixOS/nixpkgs"; };

  outputs = { self, nixpkgs }:
    let
      allSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      overlay = import ./overlay.nix;
      forAllSystems = f:
        nixpkgs.lib.genAttrs allSystems (system:
          f {
            pkgs = import nixpkgs {
              inherit system;
              overlays = [ overlay ];
            };
          });
    in {


      devShells = forAllSystems ({ pkgs }:
        let
          python = pkgs.python311;
          packages = import ./python-packages.nix { inherit python; };
        in
        {
          default = pkgs.mkShell {
            inherit packages;
            shellHook = ''
              /usr/bin/env zsh
            '';
        };
      });
    };
}
