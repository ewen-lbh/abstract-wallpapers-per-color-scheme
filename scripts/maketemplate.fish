#!/usr/bin/env fish

cp "$argv.svg" "$argv.svg.mustache"

set mustachefile "$argv.svg.mustache"

function substitute
	sd "#$argv[1]" "{{$argv[2]}}" $mustachefile
end

# Normal colors

# black (color0)
substitute 000000 color0
# red (color1)
substitute 880000 color1
# green (color2)
substitute 008800 color2
# yellow (color3)
substitute 888800 color3
# blue (color4)
substitute 000088 color4
# magenta (color8)
substitute 880088 color5
# cyan (color6)
substitute 008888 color6
# white (color7)
substitute AAAAAA color7
# bright black (color8)
substitute 000000 color8
# bright red (color9)
substitute FF0000 color9
# bright green (color10)
substitute 00FF00 color10
# bright yellow (color11)
substitute FFFF00 color11
# bright blue (color12)
substitute 0000FF color12
# bright magenta (colo13)
substitute FF00FF color13
# bright cyan (color14)
substitute 00FFFF color14
# bright white (color15)
substitute FFFFFF color15

# Special colors

substitute EEEEEE foreground
substitute BBBBBB background
substitute CCCCCC cursor

# TODO warn if there are still #(6-digit hex) (i.e. colors) in the file
