{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
		enable = true;

		profiles.default = {
			settings = {
				"zen.tabs.show-newtab-vertical" = false;
				"zen.theme.accent-color" = "#8aadf4";
				"zen.urlbar.behavior" = "float";
				"zen.view.compact.enable-at-startup" = false;
				"zen.view.compact.hide-toolbar" = true;
				"zen.view.compact.toolbar-flash-popup" = true;
				"zen.view.show-newtab-button-top" = false;
				"zen.view.window.scheme" = 0;
				"zen.welcome-screen.seen" = true;
				"zen.workspaces.continue-where-left-off" = true;
			};

			search = {
				default = "ddg";
			};

			spacesForce = true;
			spaces = {
				"Space" = {
					id = "c6de089c-410d-4206-961d-ab11f988d40a";
					position = 1000;
				};
				"Code" = {
					id = "cdd10fab-4hj5-494b-9041-325e5759195b";
					icon = "💻";
					position = 2000;
				};
			};

      pinsForce = true;
      pins = {
        "Homarr" = {
          id = "5065293b-1c04-40ee-ba1d-99a231873864";
          url = "https://homarr.local.nevimmu.xyz";
          position = 100;
          isEssential = true;
        };
        "Twitter" = {
          id = "46567946-67a4-4158-b6b6-f9fb1c9e3fb5";
          url = "https://twitter.com/";
          position = 101;
          isEssential = true;
        };
        "Instagram" = {
          id = "b7c111cc-890b-4bf4-8594-1950056c66d8";
          url = "https://instagram.com/";
          position = 102;
          isEssential = true;
        };
        "WhatsApp Web" = {
          id = "b53bf147-f0ab-4f8d-942a-6d2e000c3842";
          url = "https://web.whatsapp.com/";
          position = 103;
          isEssential = true;
        };
        "Notion" = {
          id = "a24b2afa-7530-40a2-936a-e942a9f2d7c1";
          url = "https://www.notion.so/";
          position = 104;
          isEssential = true;
        };
        "GitHub" = {
          id = "48e8a101-5a14-4826-9545-91c8e8dd4bf6";
          workspace = "cdd10fab-4hj5-494b-9041-325e5759195b";
          url = "https://github.com";
          position = 105;
          isEssential = false;
        };
        "Deepseek" = {
          id = "199e7744-75d2-475a-ac2d-bec2f2c263d3";
          workspace = "cdd10fab-4hj5-494b-9041-325e5759195b";
          url = "https://chat.deepseek.com/";
          position = 106;
          isEssential = false;
        };
        "ChatGPT" = {
          id = "9410d71e-35a0-4c2d-b240-51cda2662d60";
          workspace = "cdd10fab-4hj5-494b-9041-325e5759195b";
          url = "https://chatgpt.com/";
          position = 107;
          isEssential = false;
        };
        "Gemini" = {
          id = "54abcbe3-f757-49a1-a0bf-d419f45de06c";
          workspace = "cdd10fab-4hj5-494b-9041-325e5759195b";
          url = "https://gemini.google.com/app";
          position = 108;
          isEssential = false;
        };
      };
		};
	};
}