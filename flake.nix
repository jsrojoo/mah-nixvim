{
	description = "A very basic flake";

	inputs.nixvim.url = "github:nix-community/nixvim";
	# inputs.nixvim.url = "path:/home/nix/nix/nixvim";

	outputs = {
		self,
		nixvim,
		flake-parts,
	} @ inputs: let
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

		plugins = {
			fzf-lua = {
				enable = true;
				settings = {
					fzf_colors = true;
				};
			};

			flash = {
				enable = true;
			};
		};

		keymaps = [
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
