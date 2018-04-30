# simple_listen_to_di

Allows you to play Digitally Imported (and other streams in that station network) in the console.

## Description

Pulls the catalog for Digitally Imported (or the other service) on run, 
parses it, and presents you with a list of available stations with the 
description cropped to the size of the terminal. Uses *pick* to choose 
which one to use, calls *mplayer* to play the stream.

Currently invokes mplayer in REALLY QUIET mode. Edit the script to 
change it if you like.

## Getting Your Subscription/User Key
Requires a paid subscription to Digitally Imported. Create the file
```
$HOME/.config/diuserkey.rc
```
and put your listen key in as the first line.

You can find your listen key on the DI website under Settings -> Player Settings -> Listen Key.


## Dependencies
* [pick](https://github.com/thoughtbot/pick)
* [mplayer](https://www.mplayerhq.hu/design7/news.html)


