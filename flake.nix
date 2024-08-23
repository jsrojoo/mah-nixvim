{
	description = "A very basic flake";

	inputs.nixvim.url = "github:nix-community/nixvim";
	inputs.nixpkgs.url = "github:NixOS/nixpkgs";

	outputs = {
		self,
		nixvim,
		nixpkgs,
		flake-parts,
	} @ inputs: let

	pkgs = import <nixpkgs> { confgs = {}; overlays = []; };

	config = {
		# colorschemes.kanagawa.enable = true;
		colorschemes.rose-pine.enable = true;

		clipboard.register = "unnamedplus";

		opts = import ./configs/opts.nix;

		globals.mapleader = " ";
		extraConfigVim = ''
			map \ <leader>
			map <space> <nop>
			set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175
			'';

		extraPlugins = with pkgs.vimPlugins; [
			(pkgs.vimUtils.buildVimPlugin {
			 name = "screenkey";
			 src = pkgs.fetchFromGitHub {
			 owner = "NStefan002";
			 repo = "screenkey.nvim";
			 rev = "b1516d5";
			 hash = "sha256-gCKZLMkdGQ8u/5fsM1Iv+eGF7wRdXr7mB/tu37uJozo=";
			 };
			 })
			vim-smalls
			quick-scope
		];

		extraConfigLua = ''
			vim.g.smalls_jump_keys = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ'
		'';
		plugins = {
			fzf-lua = {
				enable = true;
				settings = {
					fzf_colors = true;
				};
			};
			gitsigns = {
				enable = true;
			};
		};

		keymaps = [
		{
			mode = "x";
			key = "s";
			action = "<Plug>(smalls)";
			options = { silent = true; };
		}
		{
			mode = "o";
			key = "s";
			action = "<Plug>(smalls)";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "s";
			action = "<Plug>(smalls)";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>fh";
			action = ":FzfLua helptags<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>fk";
			action = ":FzfLua keymaps<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>fc";
			action = ":FzfLua commands<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>cw";
			action = ":FzfLua grep_cword<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>ss";
			action = ":FzfLua blines<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader><space>";
			action = ":FzfLua buffers<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>ag";
			action = ":FzfLua live_grep<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>fa";
			action = ":FzfLua files<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>fa";
			action = ":FzfLua git_files<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>q";
			action = ":q!<cr>";
			options = { silent = true; };
		}
		{
			mode = "n";
			key = "<leader>w";
			action = ":w!<cr>";
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
