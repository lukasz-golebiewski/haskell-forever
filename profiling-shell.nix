{ pkgs ? import ./haskell-pkgs.nix
}:

let
  hsPkgs = import ./. { inherit pkgs;
    additionalModules = {
      enableLibraryProfiling = true;
      enableExecutableProfiling = true;
    };
  };
in
  hsPkgs.shellFor {
    tools = { cabal = "3.2.0.0"; hlint = "2.2.11"; };

    buildInputs = with pkgs.haskellPackages; [
      pkgs.ghcid
      pkgs.haskellPackages.hp2pretty
    ];

    # Prevents cabal from choosing alternate plans, so that
    # *all* dependencies are provided by Nix.
    exactDeps = true;
  }
