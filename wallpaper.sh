#!/bin/bash

# script to set random background wallpapers on my GNOME desktop
# set base path
export wallpaper_path=$HOME/Pictures/Wallpapers
shopt -s nullglob

# shuffle function for the wallpapers
shuffle() {
    local i tmp size max rand

   # $RANDOM % (i+1) is biased because of the limited range of $RANDOM
   # Compensate by using a range which is a multiple of the array size.
   size=${#wallpapers[*]}
   max=$(( 32768 / size * size ))

   for ((i=size-1; i>0; i--)); do
       while (( (rand=$RANDOM) >= max )); do :; done
       rand=$(( rand % (i+1) ))
       tmp=${wallpapers[i]} wallpapers[i]=${wallpapers[rand]} wallpapers[rand]=$tmp
   done
}

# store all the image file names in wallpapers array
wallpapers=(
    "$wallpaper_path"/*.jpg
    "$wallpaper_path"/*.jpeg
    "$wallpaper_path"/*.png
    "$wallpaper_path"/*.bmp
    "$wallpaper_path"/*.svg
)
# get array length
wallpapers_size=${#wallpapers[*]}

# randomly shuffle the wallpapers at start up
shuffle

# set wallpapers in incremental order
index=0
while [ $index -lt $wallpapers_size ]
do
    gsettings set org.gnome.desktop.background picture-uri "${wallpapers[$index]}"
    wal -i "${wallpapers[$index]}"
    # index is maxing out, so reset it
    if [ $(($index+1)) -eq $wallpapers_size ]
    then
        index=0
    else
        index=$(($index + 1))
    fi
    # keep the wallpaper for the specified time
    sleep 60m
done
