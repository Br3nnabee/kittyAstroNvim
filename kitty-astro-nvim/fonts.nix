{ pkgs, config, ... }:
{
  config.fonts = {
    packages = [
      config.kittyAstroNvim.nerdfont
      pkgs.font-awesome
    ];
  };
}
