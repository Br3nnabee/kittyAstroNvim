{ lib, ... }:
{
  options.kittyAstroNvim = with lib; {
    username = mkOption {
      type = types.str;
      description = "The user for whom kittyAstroNvim will be installed";
    };
    nerdfont = mkOption {
      type = types.package;
      default = pkgs.nerd-font.hack;
      description = "The Nerd Font to be used";
    };
    nodePackage = mkOption {
      type = types.package;
      defaultText = "nodejs_25";
      description = "The NodeJS version to be used";
    };
    pythonPackage = mkOption {
      type = types.package;
      defaultText = "python314Full";
      description = "The Python version to be used";
    };
  };
}
