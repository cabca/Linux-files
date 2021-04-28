Show address bar w. full path in Nautilus instead of breadcrumbs bar

Press Ctl and while holding it down, press L.

To return to the original breadcrumb view, make sure that the editable text area has the focus then press the Esc key.

To make it permanent (i.e. to always use location entry) run:

gsettings set org.gnome.nautilus.preferences always-use-location-entry true
or

dconf write /org/gnome/nautilus/preferences/always-use-location-entry true
Same commands to revert to breadcrumbs (just replace true with false).
