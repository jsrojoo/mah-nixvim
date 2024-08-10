{
  description = "A very basic flake";

  inputs.nixvim.url = "github:nix-community/nixvim";

  outputs = {
    self,
    nixvim,
    flake-parts,
  } @ inputs: let
    config = {
      colorschemes.nord.enable = true;

      clipboard.register = "unnamedplus";

      opts = import ./configs/opts.nix;

      globals.mapleader = " ";
      extraConfigVim = ''
       map \ <leader>
      '';

      keymaps = [
	{
	  mode = "n";
	  key = "<leader>q";
	  action = ":q!<cr>";
	  options = { silent = true; };
	}
      ];

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
        nvim = nixvim'.makeNixvim config;
      in {
        packages = {
          inherit nvim;
          default = nvim;
        };
      };
    };
}
