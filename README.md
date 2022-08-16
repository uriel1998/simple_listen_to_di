# simple_listen_to_di

Allows you to play Digitally Imported (and other streams in that station network) in the console.

## Description

Pulls the catalog for Digitally Imported (or the other service) on run, 
parses it, and presents you with a list of available stations with the 
description cropped to the size of the terminal. Uses *fzf* or *pick* (automatically, 
in that order) to choose a stream, then calls *mplayer* to play the stream.

By default it currently invokes mplayer or, if mplayer is not installed (looking 
at you, Debian bookworm), mpv in REALLY QUIET mode. If you have 
`cava` on your `$PATH`, it will wait a moment, then display `cava`. Quitting 
`cava` or pressing any key will kill the background instance of mplayer.

If you would rather use MPD, invoke each script with --mpd to have it pipe
the results to the end of the current MPD playlist and play it.

Edit the script to change it if you like.

## Getting Your Subscription/User Key

Requires a **paid subscription** to Digitally Imported or any of the other 
services. Create the file `$HOME/.config/diuserkey.rc` and put your listen 
key in as the first line.

You can find your listen key on the DI website under Settings -> Player Settings -> Listen Key.

## Dependencies

* [fzf](https://github.com/junegunn/fzf) OR
* [pick](https://github.com/thoughtbot/pick) 

* [mplayer](https://www.mplayerhq.hu/design7/news.html) OR
* [mpv](https://mpv.io/)


