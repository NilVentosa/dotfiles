#!/bin/bash

compton --config ~/compton.conf -b
xrdb -load ~/.Xresources
feh --bg-scale ~/images/background.jpg
xrandr --output eDP-1 --mode "1920x1200"
echo XHC1 > /proc/acpi/wakeup
