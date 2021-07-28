#!/usr/bin/env fish
function generate
	set destination .
	set theme_name "$argv[2..]"
	set artwork_id $argv[1]

	set vscode_theme_path ""
	for extension in ~/.vscode/extensions/*
		if jq -e '.contributes.themes | any(.label == "'"$theme_name"'")' "$extension/package.json" >/dev/null 2>/dev/null
			set vscode_theme_path (realpath "$extension/"(jq --raw-output '.contributes.themes[] | select(.label == "'"$theme_name"'").path' "$extension/package.json"))
			break
		end
	end
	if test "$vscode_theme_path" = ""
		echo "no extension in ~/.vscode/extensions contributes any theme named $theme_name."
		return 1
	end

	set theme_slug (echo $theme_name | string lower | sd -- '[_ .]' '-' | sd '[()]' '' | sd -- '--' '-')

	~/projects/vscode-to-kitty/vscode2wal.rb < "$vscode_theme_path" \
		| yq -Y '.colors * .special' \
		| mustache - ./$artwork_id.svg.mustache \
		> $destination/$artwork_id-$theme_slug.svg \

	convert $destination/$artwork_id-$theme_slug.svg $destination/$artwork_id-$theme_slug.png
	echo $destination/$artwork_id-$theme_slug.png
end

echo (generate $argv)
