#!/bin/bash
xrandr --addmode CRT1 1680x1050
xrandr --output CRT1 --mode 1680x1050
xrandr --output CRT1 --left-of CRT2
