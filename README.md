---
Date: 2021-11-10
Reason: This will be a repository that will house all the scripts I will be working on.
[//]: <> (This is just a comment for myself)
---

# My Bash Scripts

This repository will be a documentary of my Linux journey and learning Bash.

---

### Daily Logger

-   This script is a simple daily logger in which you run the command, and it will prompt and append your words into a text file.
-   If it doesn't work, then check the paths within the scripts

---

### Wallpaper Changer (wallpaper.sh)

-   A script that automatically changes the wallpaper of your current gnome desktop every hour
-   The wallpapers depend on the path you set within the script (within walpaper.sh)
-   It also uses pywal to change the colour scheme of your terminal to the current colour scheme of the desktop
    - https://github.com/dylanaraps/pywal/wiki/Installation
-   Note that to run this on startup, you need to path to this script in the `.profile`
```
# start my custom script for setting random background wallpapers
if [ -f "$HOME/wallpaper.sh" ] ; then
    bash $HOME/wallpaper.sh &
fi
```
-   To have this run when the terminal is open, paste the following script into your `.bashrc` file.
```
x=`gsettings get org.gnome.desktop.background picture-uri | wc -c`
y=$((x-2))
wall_length=`gsettings get org.gnome.desktop.background picture-uri | cut -c 9-$y`
wal -q -i $wall_length
```
