{ lib, ... }:

let
  inherit (lib.hm.gvariant) mkUint32;
  inherit (lib) mkDefault;
  dconflib = import ../../lib/dconf.nix { lib = lib; };
in {
  dconf = {
    enable = true;
    settings = dconflib.dconfFlattenWith mkDefault {
      net.nokyan.Resources = {
        apps-show-drive-read-speed = true;
        apps-show-drive-read-total = true;
        apps-show-drive-write-speed = true;
        apps-show-drive-write-total = true;
        apps-show-gpu-memory = true;
        apps-show-swap = true;
        graph-data-points = mkUint32 60;
        is-maximized = true;
        last-viewed-page = "cpu";
        processes-show-drive-read-speed = true;
        processes-show-drive-read-total = true;
        processes-show-drive-write-speed = true;
        processes-show-drive-write-total = true;
        processes-show-gpu-memory = true;
        processes-show-priority = true;
        processes-show-swap = true;
        processes-show-total-cpu-time = true;
        processes-sort-by-ascending = false;
        show-graph-grids = false;
        show-logical-cpus = true;
        sidebar-description = true;
        sidebar-details = true;
        sidebar-meter-type = "Graph";
      };
      org.gnome = {
        Console.theme = "night";
        TextEditor = {
          custom-font = "Fira Code Medium 12 @wght=500";
          show-line-numbers = true;
          show-right-margin = true;
          style-variant = "dark";
          tab-width = mkUint32 4;
          use-system-font = false;
        };
        desktop = {
          interface = {
            font-antialiasing = "grayscale";
            font-hinting = "full";
            gtk-im-module = "gtk-im-context-simple";
            gtk-theme = "Adwaita-dark";
            color-scheme = "prefer-dark";
            show-battery-percentage = true;
          };
          wm = {
            keybindings = {
              close = [ "<Super>q" ];
              maximize = [ ];
              minimize = [ "<Super>comma" ];
              move-to-workspace-1 = [ "<Shift><Super>1" ];
              move-to-workspace-2 = [ "<Shift><Super>2" ];
              move-to-workspace-3 = [ "<Shift><Super>3" ];
              move-to-workspace-4 = [ "<Shift><Super>4" ];
              move-to-workspace-left = [ "<Shift><Super>h" ];
              move-to-workspace-right = [ "<Shift><Super>l" ];
              switch-to-workspace-1 = [ "<Super>1" ];
              switch-to-workspace-2 = [ "<Super>2" ];
              switch-to-workspace-3 = [ "<Super>3" ];
              switch-to-workspace-4 = [ "<Super>4" ];
              switch-to-workspace-left = [ "<Control><Super>h" ];
              switch-to-workspace-right = [ "<Control><Super>l" ];
              toggle-fullscreen = [ "F11" ];
              toggle-maximized = [ "<Super>m" ];
              unmaximize = [ ];
            };
            preferences = {
              button-layout = "appmenu:minimize,maximize,close";
              num-workspaces = 4;
            };
          };
          peripherals = {
            touchpad = {
              speed = 0.5;
              tap-to-click = true;
              two-finger-scrolling-enabled = true;
            };
            mouse.speed = 0.0;
            keyboard = {
              repeat = true;
              delay = mkUint32 240;
              repeat-interval = mkUint32 16;
            };
          };
        };
        gnome-system-monitor = {
          cpu-smooth-graph = true;
          cpu-stacked-area-chart = true;
        };
        mutter = {
          dynamic-workspaces = false;
          edge-tiling = true;
          keybindings = {
            toggle-tiled-left = [ ];
            toggle-tiled-right = [ ];
          };
        };
        settings-daemon.plugins.color.night-light.enabled = true;
        settings-daemon.plugins.media-keys = {
          control-center = [ "<Super>c" ];
          email = [ "<Super>e" ];
          home = [ "<Super>f" ];
          screensaver = [ "<Control><Alt><Super>l" ];
          www = [ "<Super>b" ];
        };
        shell = {
          app-switcher.current-workspace-only = true;
          disabled-extensions = [
            "native-window-placement@gnome-shell-extensions.gcampax.github.com"
            "drive-menu@gnome-shell-extensions.gcampax.github.com"
          ];
          enabled-extensions = [
            "pop-shell@system76.com"
            "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
            "apps-menu@gnome-shell-extensions.gcampax.github.com"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
          ];
          keybindings = {
            screenshot = [ "<Super>p" ];
            screenshot-window = [ "<Alt><Super>p" ];
            show-screenshot-ui = [ "<Shift><Super>p" ];
            switch-to-application-1 = [ ];
            switch-to-application-2 = [ ];
            switch-to-application-3 = [ ];
            switch-to-application-4 = [ ];
            toggle-message-tray = [ "<Super>v" ];
            toggle-quick-settings = [ ];
          };
          extensions.pop-shell = {
            active-hint = true;
            active-hint-border-radius = mkUint32 8;
            gap-inner = mkUint32 1;
            gap-outer = mkUint32 1;
            hint-color-rgba = "rgb(255,187,0)";
            mouse-cursor-follows-active-window = false;
            show-title = false;
            smart-gaps = true;
            tile-by-default = false;
          };
          favorite-apps = [ "org.gnome.Nautilus.desktop" ];
          nautilus = {
            preferences = {
              default-folder-viewer = "list-view";
              executable-text-activation = "display";
              search-filter-time-type = "last_modified";
              search-view = "list-view";
              show-image-thumbnails = "always";
            };
            list-view.use-tree-view = true;
          };
          remember-mount-password = false;
        };
      };
      org.gtk.gtk4.settings.file-chooser.sort-directories-first = true;

      org.virt-manager = {
        connections = rec {
          uris = [ "qemu:///system" "qemu:///session" ];
          autoconnect = uris;
        };
        virt-manager.xmleditor-enabled = true;
        console.resize-guest = 1;
      };
    };
  };
}
