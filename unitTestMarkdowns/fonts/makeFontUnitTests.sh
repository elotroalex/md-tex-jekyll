for font in $(cat fonts); do
	echo $font
	ssed -e "/layout: post/a font: \"$font\"" original.md > $font.md
done	