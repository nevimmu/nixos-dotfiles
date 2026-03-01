{ inputs, pkgs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];
  
  stylix.targets.zen-browser.profileNames = [ "default" ];

  programs.zen-browser = {
    enable = true;

    languagePacks = [
      "en-US"
      "fr-FR"
    ];

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles.default =
      let
        containers = {
          Shopping = {
            color = "green";
            icon = "briefcase";
            id = 1;
          };
        };
        spaces = {
          "Space" = {
            id = "572910e1-4468-4832-a869-0b3a93e2f165";
            position = 1000;
          };
          "Code" = {
            id = "08be3ada-2398-4e63-bb8e-f8bf9caa8d10";
            icon = "💻";
            position = 2000;
          };
        };
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
      in
      {
        settings = {
          "intl.locale.requested" = "en-US,fr-FR";
          "zen.workspaces.continue-where-left-off" = true;
          "zen.workspaces.natural-scroll" = true;
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.animate-sidebar" = false;
          "zen.welcome-screen.seen" = true;
          "zen.tabs.show-newtab-vertical" = false;
          "zen.urlbar.behavior" = "float";
          "zen.view.compact.enable-at-startup" = false;
          "zen.view.compact.hide-toolbar" = true;
          "zen.view.compact.toolbar-flash-popup" = true;
          "zen.view.show-newtab-button-top" = false;
          "zen.view.window.scheme" = 0;
        };

        containersForce = true;
        pinsForce = true;
        spacesForce = true;
        inherit containers pins spaces;

        search = {
          force = true;
          default = "google";
          engines =
            let
              nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            in
            {
              "Youtube" = {
                urls = [{template = "https://youtube.com/results?search_query={searchTerms}";}];
                icon = "https://youtube.com/favicon.ico";
                definedAliases = ["yt"];
              };
              "Nix Packages" = {
                urls = [{template = "https://search.nixos.org/packages?type=packages&channel=unstable&query={searchTerms}";}];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["np"];
              };
              "NixOS Options" = {
                urls = [{template = "https://search.nixos.org/options?channel=unstable&query={searchTerms}";}];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["no"];
              };
              "NixOS Wiki" = {
                urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["nw"];
              };
              "Home Manager Options" = {
                urls = [{template = "https://home-manager-options.extranix.com/?release=master&query={searchTerms}";}];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                definedAliases = ["ho"];
              };
              "Arch Linux Wiki" = {
                urls = [{template = "https://wiki.archlinux.org/index.php?search={searchTerms}";}];
                icon = "https://wiki.archlinux.org/favicon.ico";
                definedAliases = ["aw"];
              };
              "Minecraft Wiki" = {
                urls = [{template = "https://minecraft.wiki/?search={searchTerms}";}];
                icon = "https://minecraft.wiki/favicon.ico";
                definedAliases = ["mw"];
              };
            };
        };
      };
  };
}