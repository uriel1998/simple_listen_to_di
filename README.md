# simple_listen_to_di

Allows you to play Digitally Imported (and other streams in that station network) in the console.

## Description

I wanted to be able to choose how to play streaming radio from the DI.FM family 
of stations. And while you can do that manually, I wanted to be able to switch 
easily, without going back to the website.

A prior version scraped the website to get the station names, but now thanks to 
javascript, that's not possible. However, if you have a premium membership, 
there's a one-time workaround.

Go to the site(s) in question, and favorite as many (or as few) stations as you 
like. Then go to Settings -> Player Settings -> Export Favorites, and download the pls 
file of your favorites. Do this with as many or as few of the DI.FM family of stations
as you like. 

Then invoke this script:

`listen_to_di.sh --player {mpc|mpd|audacious|mpv|deadbeef|mplayer|play|vlc} --directory /path/to/pls/files`

It uses `fzf` to allow you to choose whatever station you like from the pls files. 

Requires a **paid subscription** to Digitally Imported or any of the other 
services. 

Technically should work with ANY streaming playlist in PLS format.

## Dependencies

* [fzf](https://github.com/junegunn/fzf)  
* One of the listed players.
