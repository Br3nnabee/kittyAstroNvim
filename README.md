# Br3nnabee's AstroNvim Implementation

This is an implementation of the [AstroNvim](https://astronvim.com/)
configuration/plugin distribution for Neovim using Nix flakes. The flake contains both a
NixOS and NixDarwin module which allows for easy adaptation and installation. The flake
is not intended to be highly configurable, it was instead designed to allow me to easily
port my highly configured Neovim setup to other machines.

## Installation

A very minimal installation in a typical nix flake would look as follows:

`flake.nix`

```nix
{
  description = "My NixOS configuration";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-23.11";
    };
    kitty-astro-nvim = {
      url = "github:br3nnabee/kittyAstroNvim/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, kitty-astro-nvim }:
  {
    nixosConfigurations = {
      "my-hostname" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          kitty-astro-nvim.nixosModules.astroNvim
        ];
      };
    };
  };
}
```

`configuration.nix`

```nix
{ config, pkgs, ...}:
{
  kittyAstroNvim = {
    username = "br3nnabee";
    nerdfont = pkgs.hack-font;
    nodePackage = pkgs.nodejs_25;
    pythonPackage = pkgs.python314;
  };

  # Everything else required to configure your machine...
}
```
