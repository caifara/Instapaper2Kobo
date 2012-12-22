# Instapaper2Kobo

Some scripts found and thrown together to easily download a
working instapaper epub with the kobo browser. 
The scripts were edited and Dropbox and a bookmark trick were added to be able to load the epub without using a cable.

# The problem

I want to read [Instapaper](http://www.instapaper.com/)
articles with as few steps as possible on my Kobo Touch. For now there are two options
to my knowledge:

1. Use Calibre to automatically download your Instapaper feed. (Easy
   process,
   but you need to use a cable connection)
2. Use this (no cable, but with an extra step required)

(Hopefully the folks at Kobo solve this with their sync application
making this 'hack' obsolete)

# The idea

1. Have a shell script to download the Instapaper epub.
2. Save it to Dropbox Public folder
3. Make a bookmark in the Kobo browser to that public Dropbox file

In order to get a new epub you have to:

1. Run the shell script on your computer
2. Load the bookmark on your Kobo

Setting up a cron job may cut the first step if you wish.

# prerequisites

* bash
* perl
* dropbox

# Installing the script

* clone from github
* create file ~/.instapaper2koborc with contents:


        INSTAPAPER_USERNAME=".@."
        INSTAPAPER_PASSWORD="..."
        DROPBOX_PATH="/absolute/path"

* install some cpan modules:
  * run `sudo cpan` (you may have to configure cpan then (just press yes))
  * run `install Mozilla::CA`
* you may want to alias the script in your .bashrc or .zshrc or maybe
  even alter your $PATH to be able to call instapaper2kobo directly

# Installing the custom bookmark

* After you have run the script for the first time go to dropbox and copy the
  link to the created file at Dropbox/Public/instapaper.epub
* Make a bookmark in the kobo browser (whatever)
* Connect the kobo to your computer
* Edit the bookmark in your favorite editor at
  /kobo-path/.kobo/Kobo/Kobo eReader.conf (escape it like the saved
bookmark)

You can now download the instapaper ebook by only opening the browser
and clicking the bookmark.

# Credits

* Open Nomad: http://opennomad.com/content/instapaper-epub-issues
* throughnothing: https://gist.github.com/941581
