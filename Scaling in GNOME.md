But those of you running GNOME on a HiDPI display need not despair as you can enable experimental fractional scaling in GNOME 3.26 — but only in the Wayland session.
If you follow us on Twitter you may have seen that today, after years of avoiding it, I finally tried Ubuntu (and thus the GNOME Shell desktop) on a HiDPI display.

And… Well, let’s just say it’s clear there’s still some room for improvement!

By tweeting my own initial experiences of Ubuntu on HiDPI monitors, I got some neat tips and suggestions from out followers.

me Among them was  in the direction of various settings, hidden and otherwise.

Among them a top tip on how to enable experimental fractional scaling on GNOME 3.26.

Scaling in GNOME
Scaling is — and what follows is not a truly technical or literal definition, so don’t quote it! — the term given to making bits of the UI larger. As in scaling ’em up. By default GNOME 3.26 can only scale in whole numbers — e.g, a scaling factor of 1 (100%), 2 (200%) and so on.

A scaling factor of 2 works great on some types of high resolution displays. It doesn’t suit all.

And that’s where fractional scaling comes in. Like the name suggests this offers you scaling levels at integers between whole number, e.g., 1.25, 1.5, and so on.

I’ll save the pontification about which scaling setting is best for which resolution because a) my math sucks and I’ll get it wrong and b) what pleases my eyes might not please yours.

To enable it just pop open a new Terminal window and run:

```
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
```

Now open Displays from the Applications Overview (or through Settings > Devices > Displays) and you’ll see a number of extra scaling options nestled in the scale section:
Go ahead and try them out to see which (if any) suits your display.

```
https://149366088.v2.pressablecdn.com/wp-content/uploads/2017/09/Screen-Shot-2017-09-22-at-00.39.31.png
```

Remember: this setting is hidden, experimental and only works with Wayland. There are no guarantees that it will keep working. If you’re using the Ubuntu Xorg or GNOME Xorg sessions you can enable the setting above but you won’t see scaling options in Settings — so don’t file a bug!

If you try this out and want to disable fractional scaling support in GNOME 3.26 run:

```
gsettings reset org.gnome.mutter experimental-features
```
