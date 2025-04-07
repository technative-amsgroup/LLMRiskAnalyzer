(self0: super0:
        let
          myOverride = {
            packageOverrides = self: super: {

              "together" = super.buildPythonPackage rec {
                pname = "together";
                version = "1.5.4";
                src = super0.fetchurl {
                  url =
                    "https://files.pythonhosted.org/packages/aa/42/90cdaeac6e9db959228f77c84ab0069445302cc2e684db356417f1979052/together-1.5.4.tar.gz";
                  sha256 =
                    "b6cb28ea8d8d30723e53b2b1020b2f5924c395e24f358e948c334b049265bdfb";
                };
                format = "setuptools";
                doCheck = false;
                buildInputs = [ ];
                checkInputs = [ ];
                nativeBuildInputs = [ ];
                propagatedBuildInputs = [
                  self.setuptools
                ];
              };
            };
          };
        in {
          # Add an override for each required python version.
          # There’s currently no way to add a package that’s automatically picked up by
          # all python versions, besides editing python-packages.nix
          python3 = super0.python3.override myOverride;
          python311 = super0.python311.override myOverride;
        })
