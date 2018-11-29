#!/bin/sh
SOURCE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
while true; do
	read -p "
		-----------------| Read This before hitting y |----------------

		This script automates the installation of Popcorn Time.

		What this script does is to link popcorn-time to applications
		and create a desktop-file so you can easily find it/launch it
		among your other programs :-)


		Continue? y/n

		
" yn

	case $yn in
		[Yy]* ) echo; echo "
					Let's do it!"; echo; break;;
		[Nn]* ) echo; echo "
					Ok, bye"; echo; exit;;
		* )
		echo "
		---------------------------------------------------------------
		|	A chirping birdie told me to tell you to hit either   |
		|			   Y or N			      |
		---------------------------------------------------------------
"; echo;
	esac
done


skrivbordsfil="[Desktop Entry]
Version=1.0
Name=Popcorn Time
Comment=I super-swear to only stream and share legal content
GenericName=Torrent Streamer
Keywords=Internet;TV;Series;Movies;Shows
Exec=Popcorn-Time
Terminal=false
Type=Application
Icon=popcorntime
Categories=AudioVideo;Video;Player";

if [ -f $SOURCE"/Popcorn-Time" ];
	then
		echo "
		-----------------| Creating link to /usr/bin |--------------"; 
		echo;
		sudo sh -c "ln -sf '$SOURCE'/Popcorn-Time /usr/bin/Popcorn-Time"
		echo "
		-----------------| Creating desktop-file |------------------";
		echo;
		sudo sh -c "touch /usr/share/applications/popcorntime.desktop";
		
		sudo sh -c "echo '$skrivbordsfil' > /usr/share/applications/popcorntime.desktop";
		echo "
		--------------------| Congratulations! |-----------------------
		Your Popcorn Time should now be set up. Hope you enjoyed the
		help of this script

		/hackan :-)";

	else
		echo;
		echo "
		----------------| Well that didn't work at all |---------------

		I don't think we are in the right folder...

		For this script to work you have to run it from within the
		popcorn-time folder you got when you extracted the compressed
		archive you downloaded from https://popcorntime.sh/

		The easiest way to do this is to move this script to your
		popcorn-time folder and run it again from there.

		";
fi
