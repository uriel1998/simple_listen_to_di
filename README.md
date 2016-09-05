# simple_listen_to_di

A simple script to listen to a particular streaming station when I don't want to use my phone.

And if this particular...cough...imported...cough...station finds this,
I'd be glad to pay a fee...but not the same price I pay for Netflix. 
Instead, you can keep telling people that due to "licensing agreements" 
that I'm just playing this on my phone still.

Only pulls the basic aac (64k) streams, not the plus streams.

Base concept comes from a post on [CommandLineFu](https://www.commandlinefu.com/commands/view/17185/listen-digitally-imported-radio-from-cli-without-premium).

Currently invokes mplayer in REALLY QUIET mode. Edit the script to 
change it if you like.

Dependencies: 
* [pick](https://github.com/thoughtbot/pick)
* [mplayer](https://www.mplayerhq.hu/design7/news.html)
