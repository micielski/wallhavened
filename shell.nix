with (import <nixpkgs> {});
let
  env = bundlerEnv {
    name = "wallhavened-bundler-env";
    inherit ruby;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "wallhavened";
  buildInputs = [ env ];
}
