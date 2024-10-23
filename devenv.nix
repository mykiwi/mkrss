# https://devenv.sh/getting-started/
{ pkgs, lib, config, inputs, ... }:

let
  nixpkgs-unstable = import inputs.nixpkgs-unstable { system = pkgs.stdenv.system; };
  # dagger = import inputs.dagger { system = pkgs.stdenv.system; };
in {
  # https://search.nixos.org/packages?channel=unstable
  packages = [
    nixpkgs-unstable.git
    nixpkgs-unstable.php83Packages.castor
    # dagger.dagger
  ];

  scripts.c.exec = "castor $@";

  languages.nix.enable = true;

  # https://devenv.sh/supported-languages/php/
  languages.php.enable = true;
  languages.php.version = "8.3";
}
