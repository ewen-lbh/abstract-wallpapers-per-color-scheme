#!/usr/bin/env fish
function generate
	set wal_theme_path "$argv[2]"
	set destination "$argv[3]"
	set artwork_id $argv[1]


	set theme_slug (echo $wal_theme_path | rev | cut -d/ -f1 | rev | sd '\.json$' '' | string lower | sd -- '[_ .]' '-' | sd '[()]' '' | sd -- '--' '-')

	 yq -Y '.colors * .special' < "$wal_theme_path" \
		| mustache - ./$artwork_id.svg.mustache \
		> $destination/$artwork_id-$theme_slug.svg \

	convert $destination/$artwork_id-$theme_slug.svg $destination/$artwork_id-$theme_slug.png
	echo $destination/$artwork_id-$theme_slug.png
end

echo (generate $argv)
