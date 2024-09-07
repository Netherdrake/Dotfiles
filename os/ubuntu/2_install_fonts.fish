#!/usr/bin/env fish

set fonts DroidSansMono BitstreamVeraSansMono # Add more fonts here
set fonts_dir $HOME/.local/share/fonts
set version '3.2.1'

if not test -d $fonts_dir
    mkdir -p $fonts_dir
end

for font in $fonts
    set zip_file $font.zip
    set download_url "https://github.com/ryanoasis/nerd-fonts/releases/download/v$version/$zip_file"
    echo "Downloading $download_url"
    wget $download_url
    unzip $zip_file -d $fonts_dir -x "*.txt/*" -x "*.md/*"
    rm $zip_file
end

fc-cache -fv
