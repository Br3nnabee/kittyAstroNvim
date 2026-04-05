{ nixpkgs-unstable, pkgs, ... }:
let
  unstable = import nixpkgs-unstable {
    system = "x86_64-linux";
    config = { };
  };
in
{
  imports = [ ./common.nix ./fonts.nix ];
  config = {
    environment.systemPackages = [ pkgs.neovim-unwrapped ];
  };
}
