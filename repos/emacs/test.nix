{ pkgs ? import <nixpkgs> { overlays = [ (import ../../default.nix) ]; } }:

let
  mkTestBuild = package: let
    emacsPackages = pkgs.emacsPackagesFor package;
    emacsWithPackages = emacsPackages.emacs.pkgs.withPackages;
  in emacsWithPackages(epkgs: [ ]);

in {
  emacsUnstable = mkTestBuild pkgs.emacsUnstable;
  emacsGit = mkTestBuild pkgs.emacsGit;
  emacsPgtk = mkTestBuild pkgs.emacsPgtk;
}
