{
  description = "Mah nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    flake-parts,
    nixvim,
  } @ inputs: let
    mkConfig = { pkgs, ... }: {
      extraConfigVim = builtins.readFile ./configs/vimrc;
      extraConfigLua = builtins.readFile ./configs/init.lua;
      # extraPlugins = [
      #   (pkgs.vimUtils.buildVimPlugin {
      #     pname = "vim-dadbod";
      #     "version" = "v1.4";
      #     src = pkgs.fetchFromGitHub {
      #       owner = "tpope";
      #       repo = "vim-dadbod";
      #       rev = "v1.4";
      #       hash = "sha256-45l2cHoM5AvYx5ZQkDPjDduwU2nDS4VHfLmUkrbfMFg=";
      #     };
      #   })
      # ];

      colorschemes.nord.enable = true;
      clipboard.register = "unnamedplus";

      opts = import ./configs/opts.nix;
      plugins = import ./configs/plugins.nix;
      inherit (import ./configs/keymaps.nix) keymaps;
      autoCmd = import ./configs/autocommands.nix;
    };
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvim' = nixvim.legacyPackages."${system}";
        nvim = nixvim'.makeNixvim (mkConfig { inherit pkgs; });
      in {
        packages = {
          inherit nvim;
          default = nvim;
        };
      };
    };
}
