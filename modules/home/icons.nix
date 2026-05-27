{ pkgs, ... }:

{
    gtk.iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme.override {
            color = "yellow";
        };
    };
}
