{ pkgs ? import <nixpkgs> {}
, hscompiler ? "ghc7101"
, ... }:
let

  inherit (pkgs) stdenv haskell;

  hspkgsF = p: with p; [
    time
    servant
    servant-server
    servant-client
    cabal-install
    QuickCheck
    wai
  ];
  ghc = haskell.packages.${hscompiler}.ghcWithPackages hspkgsF;

in stdenv.mkDerivation {
  name = "datadog-shell";
  buildInputs = [ ghc ];

  shellHook = ''
    eval $(grep export ${ghc}/bin/ghc)
  '';
}
