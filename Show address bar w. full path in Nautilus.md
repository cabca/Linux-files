Show address bar w. full path in Nautilus instead of breadcrumbs bar

Press Ctl and while holding it down, press L.

To return to the original breadcrumb view, make sure that the editable text area has the focus then press the Esc key.

To make it permanent (i.e. to always use location entry) run:

```
<strong>gsettings set org.gnome.nautilus.preferences always-use-location-entry true</strong>
```

or

```
<strong>dconf write /org/gnome/nautilus/preferences/always-use-location-entry true</strong>
```

Same commands to revert to breadcrumbs (just replace true with false).
