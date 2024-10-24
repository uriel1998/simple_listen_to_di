#!/bin/bash

########################################################################
#  A simple utility to allow listening to digitally imported from CLI
#
#  by Steven Saus
#
#  Licensed under the MIT license
#  To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/.
#
#  (c) 2024 
# 
########################################################################

########################################################################
# Declarations
########################################################################


# get playlists
# all or just one?
# present contents of playlist to choose from via fzf
    # can we preview?
# send to play, mpv, vlc, mpc, etc
 

# Function to display usage
usage() {
    echo "Usage: $0 --player {mpc|mpd|audacious|mpv|deadbeef|mplayer|play|vlc} --directory /path/to/pls/files"
    exit 1
}

# Default values
player=""
pls_directory=""

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --player) player="$2"; shift ;;
        --directory) pls_directory="$2"; shift ;;
        *) echo "Unknown parameter: $1"; usage ;;
    esac
    shift
done

# Check if the required parameters are provided
if [[ -z "$player" || -z "$pls_directory" ]]; then
    usage
fi

# Check if the specified player is installed
if [ "$player" == "mpd" ];then
    player="mpc"
fi
if ! [ -f "$(which "$player" 2>/dev/null)" ]; then
    echo "Error: Player '$player' is not installed or not found in PATH."
    exit 99
fi
if [ "$player" == "mpc" ];then
    player="mpd"
fi
# Temporary file to hold the URLs and titles
temp_file=$(mktemp)

# Loop through all .pls files in the specified directory
for pls_file in "$pls_directory"/*.pls; do
    # Parse each .pls file
    while IFS= read -r line; do
        # Check if the line contains a File or Title
        if [[ $line == File* ]]; then
            url=$(echo "$line" | cut -d'=' -f2)
        elif [[ $line == Title* ]]; then
            title=$(echo "$line" | cut -d'=' -f2)
            # Append title and url to temp file
            echo "$title ‡ $url" >> "$temp_file"
        fi
    done < "$pls_file"
done

# Use fzf for user selection
selected=$(fzf < "$temp_file")

# Extract and print the selected URL
chosen_url=$(echo "$selected" | sed 's/.* ‡ //')

# Clean up temporary file
rm "$temp_file"

# Function to play the chosen URL based on the player
play_url() {
    case $player in
        mpc|mpd)
            echo "Playing with mpc"
            if [ "$MPD_HOST" != "" ];then
                HostString="--host $MPD_HOST"
            else
                HostString=""
            fi
            mpc ${HostString} clear
            mpc ${HostString} add "${chosen_url}"            
            mpc ${HostString} play 
            ;;
        audacious)
            echo "Playing with Audacious"
            audacious "${chosen_url}"
            ;;
        mpv)
            echo "Playing with MPV"
            mpv "${chosen_url}"
            ;;
        deadbeef)
            echo "Playing with Deadbeef"
            deadbeef --queue "${chosen_url}"
            ;;
        mplayer)
            echo "Playing with MPlayer"
            mplayer "${chosen_url}"
            ;;
        play)
            echo "Playing with SoX Play"
            play "${chosen_url}"
            ;;
        vlc)
            echo "Playing with VLC"
            vlc "${chosen_url}"
            ;;
        *)
            echo "Unknown player: $player"
            usage
            ;;
    esac
}

# Play the chosen URL using the selected player
play_url
