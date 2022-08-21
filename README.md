# simple_listen_to_di

Allows you to play Digitally Imported (and other streams in that station network) in the console.

## Description

Pulls the catalog for Digitally Imported (or the other service) on run, 
parses it, and presents you with a list of available stations with the 
description cropped to the size of the terminal. Uses *fzf* or *pick* (automatically, 
in that order) to choose a stream, then calls *mplayer* or *mpv* to play the stream.

If you would rather use `rofi` as a GUI picker, put `--gui` as the **FIRST** argument 
on the commandline.

By default it currently invokes mplayer or, if mplayer is not installed (looking 
at you, Debian bookworm), mpv in REALLY QUIET mode. If you have 
`cava` on your `$PATH`, it will wait a moment, then display `cava`. Quitting 
`cava` or pressing any key will kill the background instance of mplayer.

If you would rather use MPD, invoke each script with --mpd to have it pipe
the results to the end of the current MPD playlist and play it.

If you would rather pass the URL of the stream to something like my [stream_to_mpd.sh](https://git.faithcollapsing.com/yolo-mpd/tree/master/) 
utility, then invoke the script with --url to get the URL.  Example usage:

`stream_to_mpd.sh --mpd --host myseekretpassword@mympdhost $(listentodi --url)`

**NOTE** If you have issues with GUI option in an Openbox/etc menu, please try:

`sh -c 'stream_to_mpd.sh --mpd --host myseekretpassword@mympdhost $(listentodi --url)'`

as the command to call.

If you were wishing to choose using `rofi` and use `stream_to_mpd.sh`, then it would be:

`stream_to_mpd.sh --mpd --host myseekretpassword@mympdhost $(listentodi --gui --url)`

Edit the script to change it if you like.

## Getting Your Subscription/User Key

Requires a **paid subscription** to Digitally Imported or any of the other 
services. Create the file `$HOME/.config/diuserkey.rc` and put your listen 
key in as the first line.

You can find your listen key on the DI website under Settings -> Player Settings -> Listen Key.

## Dependencies

* [fzf](https://github.com/junegunn/fzf) OR
* [pick](https://github.com/thoughtbot/pick) OR
* [rofi](https://github.com/davatorium/rofi) (with the --gui switch as the *first* argument)  

* [mplayer](https://www.mplayerhq.hu/design7/news.html) OR
* [mpv](https://mpv.io/)


