{
	programs.fish = {
		enable = true;

		shellAbbrs = {
			vi = "nvim";
			vim = "nvim";
		};

		interactiveShellInit = ''
			starship init fish | source
			fish_vi_key_bindings
			zoxide init --cmd cd fish | source
		'';

		functions = {
			fish_greeting = ''
				fastfetch
			'';

			ya = ''
				set tmp (mktemp -t "yazi-cwd.XXXXXX")
				yazi $argv --cwd-file="$tmp"
				if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
					builtin cd -- "$cwd"
				end
				rm -f -- "$tmp"
			'';
		};
	};
}