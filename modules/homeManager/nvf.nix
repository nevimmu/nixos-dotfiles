{ inputs, ... }:

{
	imports = [
		inputs.nvf.homeManagerModules.default
	];

	programs.nvf = {
		enable = true;

		settings.vim = {
			keymaps = [
				# Toggle NeoTree
				{ desc = "Open tree"; key = "<C-b>"; action = "<cmd>Neotree<CR>"; mode = "n"; silent = true;}

				# Move to window using the <ctrl> hjkl keys
				{ desc = "Go to left window";  key = "<C-h>"; action = "<C-w>h"; mode = "n"; silent = true;}
				{ desc = "Go to lower window"; key = "<C-j>"; action = "<C-w>j"; mode = "n"; silent = true;}
				{ desc = "Go to upper window"; key = "<C-k>"; action = "<C-w>k"; mode = "n"; silent = true;}
				{ desc = "Go to right window"; key = "<C-l>"; action = "<C-w>l"; mode = "n"; silent = true;}
				
				# Move line up with Alt+k
				{ desc = "Move line up"; key = "<A-k>"; action = ":m-2<CR>=="; mode = "n"; silent = true;}
				{ desc = "Move line up"; key = "<A-k>"; action = "<Esc>:m-2<CR>==gi"; mode = "i"; silent = true;}
				{ desc = "Move line up"; key = "<A-k>"; action = ":m '<-2<CR>gv=gv"; mode = "v"; silent = true;}

				# Move line down with Alt+j
				{ desc = "Move line down"; key = "<A-j>"; action = ":m+1<CR>=="; mode = "n"; silent = true;}
				{ desc = "Move line down"; key = "<A-j>"; action = "<Esc>:m+1<CR>==gi"; mode = "i"; silent = true;}
				{ desc = "Move line down"; key = "<A-j>"; action = ":m '>+1<CR>gv=gv"; mode = "v"; silent = true;}

				# { desc = "Leave Terminal"; key = "<Esc><Esc>"; action = "<C-\\><C-N>"; mode = "t"; silent = true;}
				# { desc = "whichkey"; key = "<leader>wk"; action = "<cmd>WhichKey <CR>"; mode = "n"; silent = true;}
			];

			visuals = {
				# nvim-scrollbar.enable = true;
				nvim-web-devicons.enable = true;
				nvim-cursorline.enable = true;
				# cinnamon-nvim.enable = true;
				fidget-nvim.enable = true;

				highlight-undo.enable = true;
				indent-blankline.enable = true;

				# Fun
				# cellular-automaton.enable = true;
			};

			ui = {
				borders.enable = true;
				noice.enable = true;
				colorizer.enable = true;
				modes-nvim.enable = true;
				illuminate.enable = true;
				# breadcrumbs = {
				# 	enable = isMaximal;
				# 	navbuddy.enable = isMaximal;
				# };
				smartcolumn = {
					enable = false;
					setupOpts.custom_colorcolumn = {
						nix = "110";
						python = "88";
						ruby = "120";
						java = "130";
						go = ["90" "130"];
					};
				};
				fastaction.enable = true;
			};

			statusline = {
				lualine = {
					enable = true;
					# Theme is managed by Stylix
				};
			};

			# Theme is managed by Stylix
			# theme = {
			# 	enable = true;
			# 	name = "rose-pine";
			# 	style = "moon";
			# 	transparent = false;
			# };

			# ------ NeoTree ------
			filetree = {
				neo-tree = {
					enable = true;
					setupOpts = {
						auto_clean_after_session_restore = true;
						close_if_last_window = true;

						default_component_configs = {
							indent = {
								padding = 0;
								indent_size = 1;
							};
							icon = {
								folder_closed = "";
								folder_open = "";
								folder_empty = "";
								default = "";
							};
							modified = {symbol = "●";};
							git_status = {
								symbols = {
									added = "";
									deleted = "";
									modified = "";
									renamed = "➜";
									untracked = "★";
									ignored = "◌";
									unstaged = "✗";
									staged = "✓";
									conflict = "";
								};
							};
						};

						window = {
							position = "right";
							width = 30;
							mappings = {
								"<space>" = null;
								"h" = "close_node";
								"l" = "open";
							};
						};
					};
				};
			};
			# ------ End NeoTree ------

			tabline = {
				nvimBufferline.enable = true;
			};

			telescope.enable = true;

			binds = {
				whichKey.enable = true;
				cheatsheet.enable = true;
			};

			git = {
				enable = true;
				gitsigns.enable = true;
				gitsigns.codeActions.enable = false; # throws an annoying debug message
			};

		};
	};
}