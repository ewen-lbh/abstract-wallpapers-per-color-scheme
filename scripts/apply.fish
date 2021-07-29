#!/usr/bin/env fish

set theme_slug (echo $argv[2..] | string lower | sd -- '[_ .]' '-' | sd -- '--' '-')
set wallpaper_path ./$argv[1]-$theme_slug.png

if test ! -f $wallpaper_path
	echo building wallpaper $wallpaper_path...
	./generate.fish $argv
end

feh --bg-fill --no-xinerama "$wallpaper_path"

