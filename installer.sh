#!/bin/sh
#####################################################
## Desktop Environment Installer/Manager Script version2 beta.
## THIS SCRIPT WAS MADE FOR PROOT-DISTRO DISTROS FROM TERMUX, DO NOT EXECUTE THIS SCRIPT ON THE REAL LINUX MACHINE, OTHERWISE IT WOULD NOT GONNA WORK!
## Created By	: datbadwolf97/redwolf7
## Contributor	: Yonle (YonleCoder)
## License	: GNU Public License V2.0 (gpl-2.0)
####################################################
if find .openme >/dev/null 2>&1
	then
	echo
else
	exit
fi
echo "Checking if this script was running on proot or not."
sleep 1
## Checks if this script is indeed running under PROOT environment, would exits automatically if it's not.
if pgrep -x "proot" >/dev/null
then
	echo "Yep, it is."
	echo " "
	sleep 1.5
else
	echo "Nope, it doesn't, exiting."
	sleep 1.5
	exit
fi
clear
## Codes starts here.
function mainmenu
{
  if command -v chafa >/dev/null; then
  chafa logo.png --size 15
  else
  echo "Chafa is not installed."
  fi
  echo "====================================================="
  echo -e "Welcome to Desktop Environment XFCE4 Installer/manager. \nFor Debian/Ubuntu/Debian based distros."
  echo "====================================================="
  echo "PROOT-DISTRO ONLY! DO NOT USE IT ON THE REAL MACHINE!"
  echo "====================================================="
  echo "Choose an option below."
  echo " "
  echo -e "1.   Full Installation (Extended with various plugins). \n2.   Standard Installation (Basic XFCE4 DE with minimal plugins). \n3.   Lite Installation (DE only, no plugins). \n4.   Install DE only (in case you'd like to use XSDL instead of VNC). \n5.   Multimedia installer (Metapackages). \n6.   PAM Fixer. \n7.   SUDO unlock. \n8.   Fix DE. \n9.   Uninstall DE. \n10.  Create and copy the XSTARTUP script. \n11.  Fix XSTARTUP script. \n12.  Create the 'vnc-start' script. \n13.  Check your system hardwares. \n14.  Help and About. \n15.  Exit."
  echo " "
  read -p "Your option, sir : " optisel1
  	if [ $optisel1 -eq 1 ]
  	then
  	fullinstall
  	elif [ $optisel1 -eq 2 ]
  	then
  	mediuminstall
  	elif [ $optisel1 -eq 3 ]
  	then
  	liteinstall
  	elif [ $optisel1 -eq 4 ]
  	then
  	xfce4onlyinstall
  	elif [ $optisel1 -eq 5 ]
  	then
  	mminstall
  	elif [ $optisel1 -eq 6 ]
  	then
  	pam_fix
  	elif [ $optisel1 -eq 7 ]
  	then
  	sudo_unlock
  	elif [ $optisel1 -eq 8 ]
  	then
  	de_fixer
  	elif [ $optisel1 -eq 9 ]
  	then
  	purge_de
  	elif [ $optisel1 -eq 10 ]
  	then
  	xstartupmake
  	elif [ $optisel1 -eq 11 ]
  	then
  	fix_xstartup
  	elif [ $optisel1 -eq 12 ]
  	then
  	makevncstartscript
  	elif [ $optisel1 -eq 13 ]
  	then
  	checkupsys
  	elif [ $optisel1 -eq 14 ]
  	then
  	help_and_about
  	elif [ $optisel1 -eq 15 ]
  	then
  	echo "Thank you for using this script, exiting..."
  	sleep 1.1
  	clear
  	exit
  	else
  	echo "Uhmmm what? There was no $optisel1 option above."
  	sleep 1.2
  	fi
}

function fullinstall
{
	if [ whoami != root ]
	then
	echo "Oh boy, here comes the most heaviest ever installations, oh also you're not in ROOT user sooooo, well, at least you're safe for now, I guess?"
	sleep 0.5
	echo "Installing, this might heat your arse up so sit back and enjoy your coffee or tea."
	sudo apt update
	sudo apt upgrade -y
	sudo apt install sudo -y
	sudo apt install  xfce4 xfce4-goodies dbus-x11 tigervnc-standalone-server -y
	while true; do
	read -p "Do you want to create 'xstartup' script [Y/N] ? :" yn1
	case $yn1 in
	y*|Y*)
	echo "I got you."
	mkdir .vnc
	mv .vnc $HOME
	cat <<- EOF > xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
exec startxfce4
	EOF
	mv xstartup $HOME/.vnc/
	sudo chmod u+x $HOME/.vnc/xstartup
	echo "Done it."
	read -p "Press ENTER to return."
	break
	;;
	n*|N*)
	echo "Ok, skipping."
	read -p "Press ENTER to return."
	break
	;;
	*) echo "You have to answer with Y or N." ;;
	esac
	done
	echo "BOOM! SUCESSFULLY DEPLOYED!"
	sleep 1
	else
	echo "Modern problems requires ROOT user, so it was you."
	sleep 0.5
	echo "Installing, this might takes you to the Cloud 9 by Tobu, don't worry just start vibing while you're away from keyboard, let me take care of this installations."
	apt update
	apt upgrade -y
	apt install sudo -y
	apt install  xfce4 xfce4-goodies dbus-x11 tigervnc-standalone-server -y
	while true; do
	read -p "Do you want to create 'xstartup' script [Y/N] ? :" yn2
	case $yn2 in
	y*|Y*)
	echo "I got you."
	mkdir .vnc
	mv .vnc $HOME
	cat <<- EOF > xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
exec startxfce4
	EOF
	mv xstartup $HOME/.vnc/
	sudo chmod u+x $HOME/.vnc/xstartup
	echo "Done it."
	read -p "Press ENTER to return."
	break
	;;
	n*|N*)
	echo "Ok, skipping."
	read -p "Press ENTER to return."
	break
	;;
	*) echo "You have to answer with Y or N." ;;
	esac
	done
	echo "Done it, happy now?"
	sleep 1.1
	fi
}

function mediuminstall
{
	if [ whoami != root ]
	then
	echo "Bruh, Non ROOT user...."
	sleep 0.5
	echo "Installing, it takes a wee bit time, sit back and enjoy your coffee or tea."
	sudo apt update
	sudo apt upgrade -y
	sudo apt install sudo -y
	sudo apt install  xfce4 dbus-x11 tigervnc-standalone-server -y
	while true; do
	read -p "Do you want to create 'xstartup' script [Y/N] ? :" yn3
	case $yn3 in
	y*|Y*)
	echo "I got you."
	mkdir .vnc
	mv .vnc $HOME
	cat <<- EOF > xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
exec startxfce4
	EOF
	mv xstartup $HOME/.vnc/
	sudo chmod u+x $HOME/.vnc/xstartup
	echo "Done it."
	read -p "Press ENTER to return."
	break
	;;
	n*|N*)
	echo "Ok, skipping."
	read -p "Press ENTER to return."
	break
	;;
	*) echo "You have to answer with Y or N." ;;
	esac
	done
	echo "Yas, done it."
	sleep 1
	else
	echo "ROOT user? oh HELL YEA BABY, MORE FREEDOM, NO MORE SUDO SHIET."
	sleep 0.5
	echo "Installing, while waiting this process, how about touch some grasses? Or maybe sit back and enjoy your coffee or tea?"
	apt update
	apt upgrade -y
	apt install sudo -y
	apt install  xfce4 dbus-x11 tigervnc-standalone-server -y
	while true; do
	read -p "Do you want to create 'xstartup' script [Y/N] ? :" yn4
	case $yn4 in
	y*|Y*)
	echo "I got you."
	mkdir .vnc
	mv .vnc $HOME
	cat <<- EOF > xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
exec startxfce4
	EOF
	mv xstartup $HOME/.vnc/
	sudo chmod u+x $HOME/.vnc/xstartup
	echo "Done it."
	read -p "Press ENTER to return."
	break
	;;
	n*|N*)
	echo "Ok, skipping."
	read -p "Press ENTER to return."
	break
	;;
	*) echo "You have to answer with Y or N." ;;
	esac
	done
	echo "Done it."
	sleep 1
	fi
}

function liteinstall
{
	if [ whoami != root ]
	then
	echo "Non ROOT user detected, are you a little afraid of damaging your OS?"
	sleep 0.5
	echo "Oh boy, here we go for the Lite installations, it doesn't take a long time I guess?."
	sudo apt update
	sudo apt upgrade -y
	sudo apt install sudo -y
	sudo apt install  xfce4 dbus-x11 tigervnc-standalone-server -y --no-install-recommends
	while true; do
	read -p "Do you want to create 'xstartup' script [Y/N] ? :" yn5
	case $yn5 in
	y*|Y*)
	echo "I got you."
	mkdir .vnc
	mv .vnc $HOME
	cat <<- EOF > xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
exec startxfce4
	EOF
	mv xstartup $HOME/.vnc/
	sudo chmod u+x $HOME/.vnc/xstartup
	echo "Done it."
	read -p "Press ENTER to return."
	break
	;;
	n*|N*)
	echo "Ok, skipping."
	read -p "Press ENTER to return."
	break
	;;
	*) echo "You have to answer with Y or N." ;;
	esac
	done
	echo "That's kinda tricky, isn't it?"
	sleep 1
	else
	echo "Ahhh I see, a man of ROOT user as well."
	sleep 0.5
	echo "Hey Linux! One Lite installations, please?"
	apt update
	apt upgrade -y
	apt install sudo -y
	apt install  xfce4 dbus-x11 tigervnc-standalone-server -y --no-install-recommends
	while true; do
	read -p "Do you want to create 'xstartup' script [Y/N] ? :" yn6
	case $yn6 in
	y*|Y*)
	echo "I got you."
	mkdir .vnc
	mv .vnc $HOME
	cat <<- EOF > xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
exec startxfce4
	EOF
	mv xstartup $HOME/.vnc/
	sudo chmod u+x $HOME/.vnc/xstartup
	echo "Done it."
	read -p "Press ENTER to return."
	break
	;;
	n*|N*)
	echo "Ok, skipping."
	read -p "Press ENTER to return."
	break
	;;
	*) echo "You have to answer with Y or N." ;;
	esac
	done
	echo "Eyy boss, it's all done!"
	sleep 1
	fi
}

function de_fixer
{
	if [ whoami != root ]
	then
	echo "Bro, what you have done with the DE? Aight lemme fix this."
	sudo apt reinstall xfce4 -y
	else
	echo "My lord, it's all over the places, lemme fix it all up."
	apt reinstall xfce -y
	fi
	sleep 1.1
	read -p "Done it, press ENTER to return."
}

function xfce4onlyinstall
{
	while true
	do
		clear
		chafa logo.png --size 15
		echo "====================================================="
		echo -e "1. Full installations (DE and their surpluses). \n2. Medium installations (Just the DE itself with minimal plugins). \n3. Lite Installations (DE only, no plugins or anything else). \n4. Return to main menu."
		read -p "Your input, please : " optinput2
		if [ $optinput2 -eq 1 ]
		then
			if [ whoami == root ]
			then
			echo "ROOT user detected."
			sleep 1.1
			apt update
			apt upgrade -y
			apt install xfce4 xfce4-goodies dbus-x11 -y
			echo " "
			echo "Done it!."
			return
			else
			echo "Non ROOT user detected."
			sleep 1.1
			sudo apt update
			sudo apt upgrade -y
			sudo apt install xfce4 xfce4-goodies dbus-x11 -y
			echo "Done it."
			return
			fi
		elif [ $optinput2 -eq 2 ]
		then
		if [ whoami == root ]
			then
			echo "ROOT user detected."
			sleep 1.1
			apt update
			apt upgrade -y
			apt install xfce4 dbus-x11 -y
			echo " "
			echo "Done it!."
			return
			else
			echo "Non ROOT user detected."
			sleep 1.1
			sudo apt update
			sudo apt upgrade -y
			sudo apt install xfce4 dbus-x11 -y
			echo "Done it."
			return
			fi
		elif [ $optinput2 -eq 3 ]
		then
		if [ whoami == root ]
			then
			echo "ROOT user detected."
			sleep 1.1
			apt update
			apt upgrade -y
			apt install xfce4 dbus-x11 --no-install-recommends -y
			echo " "
			echo "Done it!."
			return
		else
			echo "Non ROOT user detected."
			sleep 1.1
			sudo apt update
			sudo apt upgrade -y
			sudo apt install xfce4 dbus-x11 --no-install-recommends -y
			echo "Done it."
			return
			fi
		elif [ $optinput2 -eq 4 ]
		then
		return
		else
		echo "There was no $optinput2 above."
		sleep 1.1
		clear
		fi
	done
}

function mminstall
{
	while true; do
	clear
	echo "Multimedia Installer (Metapackages)."
	echo "=========================================="
	echo "Select the packages you'd like to install."
	echo -e "1. Audacious Audio player. \n2. MPV Video Player. \n3. FFMPEG Codecs Libraries. \n4. I want all of them. \n5. nvm, take me back..."
	read -p "Your input here : " mminput1
		if [ $mminput1 -eq 1 ]; then
			if [ whoami == root ]; then
			echo "Installing Audacious as ROOT."
			apt update
			apt install audacious -y
			echo "Installed!"
			sleep 1
			else
			echo "Installing Audacious as $(whoami)."
			sudo apt update
			sudo apt install audacious -y
			echo "Installed!"
			sleep 1
			fi
		elif [ $mminput1 -eq 2 ]; then
			if [ whoami == root ]; then
			echo "Installing MPV as ROOT."
			apt update
			apt install mpv -y
			echo "Installed!"
			sleep 1
			else
			echo "Installing MPV as $(whoami)."
			sudo apt update
			sudo apt install mpv -y
			echo "Installed!"
			sleep 1
			fi
		elif [ $mminput1 -eq 3 ]; then
			if [ whoami == root ]; then
			echo "Installing FFMPEG as ROOT."
			apt update
			apt install ffmpeg -y
			echo "Installed!"
			sleep 1
			else
			echo "Installing FFMPEG as $(whoami)."
			sudo apt update
			sudo apt install ffmpeg -y
			echo "Installed!"
			sleep 1
			fi
		elif [ $mminput1 -eq 4 ]; then
			if [ whoami == root ]; then
			echo "Installing all of them as ROOT."
			apt update
			apt install ffmpeg audacious mpv -y
			echo "Installed!"
			sleep 1
			else
			echo "Installing all of them as $(whoami)."
			sudo apt update
			sudo apt install ffmpeg audacious mpv -y
			echo "Installed!"
			sleep 1
			fi
		elif [ $mminput1 -eq 5 ]; then
		echo "Oh ok...."
		sleep 1
		clear
		return
		else
		echo "No $mminput1 above, re read it again."
		sleep 1.5
		clear
		fi
	done
}

function pam_fix
{
	echo "Fixing PAM permission."
	sleep 1
	echo "Hold up, lemme check the file first..."
		if cat /etc/pam.d/chsh | grep "auth       required   pam_shells.so" 2>/dev/null; then
		echo "Yeb, it is."
		sleep 1
		sed -i 's/required/sufficient/g' /etc/pam.d/chsh
		echo "Done it, now you can do the chsh without being asked for password."
		sleep 1
		else
		echo "It was already modified tho..."
		sleep 1
		fi
}

function sudo_unlock
{
	echo "Unlocking SUDO so you won't have to type your password overtime."
		if [ whoami == root ]; then
		echo "Wait...you're ROOT user, can't perform this action!"
		return
		else
		echo "Non ROOT user detected."
		sed -i "45i $(whoami) ALL=(ALL) NOPASSWD:ALL" /etc/sudoers
		sleep 1
		echo "Done it."
		return
		fi
}

function purge_de
{
	clear
	local i=1
	for i in $(seq 3 -1 1); do
		echo "Purging the DE in $i."
		sleep 1
	done
	while true; do
	clear
	read -p "Wait, hold up, are you sure about this (yes/no)? " confirmq1
	if [ $confirmq1 == "yes" ]
	then
	echo "As you wish."
	sleep 1.1
		if [ whoami != root ]
		then
		sudo apt purge xfce4-* tigervnc-standalone-server -y
		echo "Y"
		else
		apt purge xfce4 xfce4-* tigervnc-standalone-server -y
		echo "N"
		fi
	return
	elif [ $confirmq1 == "no" ]
	then
	echo "Oh ok, cancelling....."
	sleep 1.1
	return
	else
	echo "You have to answer yes/no."
	fi
	done
}

function xstartupmake
{
	echo "Creating and copying the script."
	sleep 1.1
	mkdir .vnc
	mv .vnc $HOME
	cat <<- EOF > xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
exec startxfce4
	EOF
	mv xstartup $HOME/.vnc
	chmod u+x $HOME/.vnc/xstartup
	sleep 1.1
	echo "Done it!"
}

function fix_xstartup
{
	echo "Aight, let me see if there was an xstartup script on /home directory."
	sleep 1.1
	updatedb
	if locate xstartup 2>/dev/null
	then
	echo "Nope, aight let me fix this problem, hang on."
	sleep 1.1
	mkdir .vnc
	mv .vnc $HOME
	cat <<- EOF > xstartup
#!/bin/sh
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
export PULSE_SERVER=127.0.0.1 && pulseaudio --start --disable-shm=1 --exit-idle-time=-1
exec startxfce4
	EOF
	chmod u+x xstartup
	mv xstartup $HOME/.vnc
	echo "Done it, happy now?"
	sleep 1.1
	else
	echo "It's already there, wdym it's broken? The problem might not be in xstartup script, try to restart the proot session or even restart your device manually."
	sleep 3
	clear
	fi
}

function makevncstartscript
{
	clear
	echo "Oh okay..."
	echo "Enter your Height x Weight of your screen size."
	read -p "Height : " h1
	read -p "Weight : " w1
	read -p "On which port? : " portnum1
	echo "Aight gottem, let me type it all."
	sleep 1.2
	cat <<- EOF > vnc-start
#!/bin/sh
case \$1 in
	v|vertical)
	vncserver -geometry ${w1}x${h1} :${portnum1}
	;;
	h|horizontal)
	vncserver -geometry ${h1}x${w1} :${portnum1}
	;;
	s|kill)
	vncserver -kill :${portnum1}
	;;
	*) echo "Unknown option, please input h for Horizontal orientation or v for Vertical orientation, s or kill to kill the session, insert the option after the command." ;;
esac
	EOF
	chmod u+x vnc-start
	mv vnc-start /bin
	echo "Gottem, just type vnc-start with their available options!"
	sleep 1.1
	clear
}

function help_and_about
{
	clear
	chafa logo.png --size 15
	echo "====================================================="
	echo -e "This Bash script was intended for installing XFCE4 Desktop Environment and TigerVNC Standalone Server packages. \nPlease be advised that it requires a lot, I repeat, A LOT of resources (RAM and Storage) depending on the installation type."
	echo "=================================================="
	echo "Supported Distros : "
	echo -e "1. Debian. \n2. Ubuntu."
	echo "=================================================="
	echo "This script depends on these packages (can be fulfilled with executing installdeps.sh) : "
	echo -e "1. sudo. \n2. procps. \n3. apt-utils.\n4. neofetch. \n6. mlocate"
	echo "=================================================="
	echo "Installation sizes on each options : "
	echo -e "1. Full Installation : DL 210MB INS 840MB. \n2. Medium Installation : DL 197MB INS 779MB. \n3. Lite Installations : DL 90.3MB INS 371MB."
	echo "* Note that not every architectures has the same DL and INS sizes, it might be higher or lower."
	echo "** These sizes were based on ARM64 architecture."
	echo "*** As per 9 October 2022."
	echo "=================================================="
	echo "Minimum Specifications : "
	echo "RAM 2GB, 16GB (2GB Free) Internal Memory, Quad Core 2.0GHz (such as Mediatek Helio A22), Android 8."
	echo "--------------------------------------------------"
	echo "Mid Tier Specifications : "
	echo "RAM 4GB, 64GB (4GB Free) Internal Memory, Octa Core 1.6GHz (such as UNISOC Tiger T606), Android 11."
	echo "--------------------------------------------------"
	echo "Recommended Specifications : "
	echo "RAM 6~8GB, 128GB (6GB Free) Internal Memory, Octa Core 1.8~2.2GHz (Snapdragon SD460 will do the most), Android 11 or 13."
	echo "=================================================="
	echo "Made with only shell script, no python or some bullshiets required!"
	echo "Oh ya also why there was no colours in this enterities?"
	echo "(Ya know what? THIS AIN'T YO RGB FANCY SETUPS.)"
	echo "=================================================="
	echo "Created by datbadwolf97."
	echo "Contributor : Yonle (YonleCoder)."
	echo "--------------------------------------------------"
	echo "Version 0.5 beta."
	echo "=================================================="
	read -p "Press ENTER to go back."
	clear
}

function checkupsys
{
	clear
	echo "-------------------------------------------------"
	echo "Here's the informations about your hardwares : "
	echo "-------------------------------------------------"
	neofetch --off --color_blocks off
	echo "-------------------------------------------------"
	read -p "Press ENTER to navigate back."
}

while true
 do
	mainmenu ## ayyo 500+ lines!? no f'ing way!
	clear
done
## Well, might add another lines on the other day.....
## Or I won't?
## IDK, no thoughts head empty.....
## Oh also there was an easter egg inside this script, can you find it?
## No?
## If so, what an unfortunate person....
## F in the chat....
## Anyway, who was Joe?

