{ pkgs ? import ./haskell-pkgs.nix
, haskellCompiler ? "ghc8101"
, additionalModules ? {}
}:
pkgs.haskell-nix.cabalProject {
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "haskell-forever";
    src = ./.;
  };
  compiler-nix-name = haskellCompiler;
  modules = [
    additionalModules
  ];
}
