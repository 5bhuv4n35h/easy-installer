#!/bin/bash

##### (Cosmetic) Colour output
RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

str='▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒'

echo -e "${YELLOW}"
cat << "EOF"
 ___  ____ ________  __   (_)___  _____/ /_____ _/ / /__  _____         
| _ \/ __ `/ ___/ / / /  / / __ \/ ___/ __/ __ `/ / / _ \/ ___/        
| __/ /_/ (__  ) /_/ /  / / / / (__  ) /_/ /_/ / / /  __/ /           
|___/\__,_/____/\__, /  /_/_/ /_/____/\__/\__,_/_/_/\___/_/          
               /____/    

    __           _                  ____
   / /______ _/ (_)  _   __   <  / / __ \
  / //_/ __ `/ / /  | | / /   / / / / / /
 / ,< / /_/ / / /   | |/ /   / /_/ /_/ / 
/  |_|\__,_/_/_/    |___/   /_/(_)____/ 

EOF
echo -e "${GREEN}"


##################################installation starts ######################################
options=("install passwordless sudo" "install packages" "remove-lock"  "install apt https" "fancy bash prompt installer" "Quit")
select opt in "${options[@]}"
do
    case $opt in
    	"install passwordless sudo")
        sudo apt install -y kali-grant-root && sudo dpkg-reconfigure kali-grant-root
        ;;


  "install packages") 

printf "\033[K"             # clear to end-of-line

tput cnorm  

# powershell installation ${GREEN}
psh=$(dpkg -l | grep "powershell")
if [ "$psh" ]; then
 	echo -e "${RED}you have already installed powershell skipping installation ${GREEN}"
 	tput civis                  # make cursor invisible

 for i in `seq 1 5`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
	else
		sudo apt install powershell
fi
#wine installation ${GREEN}
win=$(dpkg -l | grep "wine")
if [ "$win" ]; then
	echo -e " ${RED} you have already installed wine skipping installation ${GREEN}"
	tput civis                  # make cursor invisible

 for i in `seq 5 15`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
	
	else
		sudo dpkg --add-architecture i386
		sudo apt update
		sudo apt install wine:i386
		sudo apt install wine-bin:i386
fi

shel=$(dpkg -l | grep "shellter")
if [ "$shel" ]; then
	echo -e "${RED} you have installed shellter skipping installation ${GREEN} "
	tput civis                  # make cursor invisible

 for i in `seq 15  25`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
	
	else
		sudo apt update
		#shellter installation ${GREEN}
		sudo apt install shellter
fi
gob=$(dpkg -l | grep "gobuster")
if [ "$gob" ]; then
	echo -e "${RED}you have already installed gobuster skipping installation ${GREEN} "
	tput civis                  # make cursor invisible

 for i in `seq 25 35`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
		#gobuster instllation
	
	else
		sudo apt install gobuster
fi
secl=$(dpkg -l | grep "seclists")
if [ "$secl" ]; then
	echo -e "${RED}you have already installed seclists skipping installation ${GREEN}"
   for i in `seq 35  40`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
 	 #seclists installation ${GREEN}
	 
	else
 		sudo apt install seclists
fi

#docker installation ${GREEN}
docc=$(dpkg -l | grep "docker")
if [ "$docc" ]; then
	echo -e "${RED}you have already installed docker skipping installation ${GREEN}"
	for i in `seq 40 55`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
	else

		sudo apt update
		sudo apt -y install curl gnupg2 apt-transport-https software-properties-common ca-certificates
		curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
		echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable" | sudo tee  /etc/apt/sources.list.d/docker.list
		sudo apt update
		sudo apt install docker-ce docker-ce-cli containerd.io
		sudo usermod -aG docker $USER
        newgrp docker
fi

figg=$(ls /usr/share| grep "figlet")
if [ "$figg" ]; then
	echo -e "${RED}you have already installed figlet skipping installation ${GREEN}"
	for i in `seq  55 60`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
 	
 	else
	#figlet installation ${GREEN}
		cd /usr/share
		wget ftp://ftp.figlet.org/pub/figlet/program/unix/figlet-2.2.5.tar.gz 
		tar -xvf  figlet-2.2.5.tar.gz
		rm figlet-2.2.5.tar.gz
		cd ..
fi
if [ "$figg" ]; then
	echo -e "${RED}you have already installed lolcat skipping installation ${GREEN}"
	for i in `seq 60 75`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
	else
		cd /usr/share
		sudo git clone https://github.com/busyloop/lolcat

		cd lolcat
		cd  bin && sudo gem install lolcat
		cd ..
		cd /usr/share
        sudo git clone https://github.com/xero/figlet-fonts
		mv figlet-fonts/* figlet && rm –rf figlet-fonts
fi
#scrot installation ${GREEN}
scre=$(dpkg -l | grep "scrot")
if [ "$scre" ]; then
	echo -e "${RED}you have already installed scrot skipping installation ${GREEN}"
	for i in `seq 75 80`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
	
	else
		sudo apt install scrot
fi
# openning  realvnc website
rvnc=$(dpkg -l | grep "realvnc")
if [ "$rvnc" ]; then
	echo -e "${RED}you have already installed realvnc skipping installation ${GREEN}"
	for i in `seq 80 85`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
   
   else

		firefox https://www.realvnc.com/en/connect/download/vnc/
		sleep 120
		cd  ~/Downloads
		ls
      #removing xtightvncviewer
		sudo apt remove tightvncserver
		sudo apt remove xtightvncviewer
		ls
      #installing vnc from .deb files

		sudo dpkg -i   VNC-Server-*.deb
		ls

		sudo dpkg -i  VNC-Viewer-*.deb
fi
#anydeskinstall
anydesk1=$(dpkg -l | grep "anydesk")
if [ "$anydesk1"]; then

echo "anydesk not installed"
else
	echo -e "\n installing anydesk"
wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
apt update
apt install anydesk
echo -e "completed installing anydesk"
fi
#empire install
emp1=$(ls /opt | grep "Empire")
if [ "$emp1" ]; then
	echo -e "${RED}you have already installed empire skipping installation ${GREEN}"
	
     
	
	else
		cd  /opt
		sudo git clone https://github.com/EmpireProject/Empire.git
 
		cd Empire
		sudo ./setup/install.sh
fi

subli=$(dpkg -l | grep "sublime")

if [ "$subli" ]; then
	echo -e "\n ${RED}you have already installed sublime skipping installation ${GREEN}"
	
    
    else
 		wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
		sudo apt-get install apt-transport-https
		echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
		sudo apt-get update
		sudo apt-get install sublime-text
fi

typori=$(dpkg -l | grep "typora")
if [ "$typori" ]; then

    echo -e "${RED}you have already installed typora skipping installation ${GREEN}"
    
    else
		wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
		echo -e "\ndeb https://typora.io/linux ./" | sudo tee -a /etc/apt/sources.list.d/typora.list
		sudo apt-get update
		sudo apt-get install typora
fi


#the fat rat installation
ftr=$(ls /usr/share | grep "TheFatRat")
if [ "$ftr" ]; then
  echo -e "${RED}you have already installed TheFatRat  skipping installation"
  else
  	cd /usr/share
  	sudo apt install xterm
  sudo git clone https://github.com/Screetsec/TheFatRat.git
  cd TheFatRat
  sudo chmod +x setup.sh && sudo  ./setup.sh
  cd /usr/share/TheFatRat && ./update && sudo chmod +x setup.sh &&sudo  ./setup.sh

  cd ~

fi
# remina remote desktop installation ${GREEN}
remid=$(dpkg -l | grep "remmina")
if [ "$remid" ]; then 
	
	echo -e "${RED}you have already installed  remmina skipping installation ${GREEN}"
    else 
	 echo 'deb http://ftp.debian.org/debian stretch-backports main' | sudo tee --append /etc/apt/sources.list.d/stretch-backports.list >> /dev/null
		sudo apt update
		sudo apt install -t stretch-backports remmina remmina-plugin-rdp remmina-plugin-secret remmina-plugin-spice
		sudo rm -r /etc/apt/sources.list.d/stretch-backports.list
fi

echo -e " \n"
echo -e "\n ${GREEN} installation completed"
;;
#########################################lock starts############################################################################
  "remove-lock") 
    lck=$( ls /var/lib/dpkg/lock | grep "lock" )

    if [ "$lck" ]; then
    	echo -e "sorry no lock has been detected u can run 1 to continue installation" 
    else
	sudo rm  /var/lib/dpkg/lock-frontend 
	sudo rm /var/lib/dpkg/lock
	sudo rm /var/cache/apt/archives/lock
	sudo rm /var/lib/apt/lists/lock
	for i in `seq  1 100`; do    # for 1 to 100, save cursor, restore, output, restore
    printf "\033[s\033[u removing  lock in Progress: %s %3d %% \033[u" "${str:0:$(((i+1)/2))}" "$i"
    sleep 0.1               # small delay
    done
	echo -e "\n sucess"
    fi
;;
#############################################apt-https########################################################
"install apt https")
echo " changing apt to https from https makes the apt process faster"
sudo apt update 
sudo apt-get install apt-transport-https -y
echo " changing nameserver increases overall speed "
sudo echo -e "  \n nameserver 8.8.8.8 \n  nameserver 8.8.4.1">> sudo /etc/resolv.conf
sudo nano /etc/resolv.conf
echo "changed resolv.conf and installed https for deb installation"
;;
#######################fancy bash prompt ######################################################
"fancy bash prompt installer")
cd /tmp && git clone https://github.com/petobens/trueline.git && cd trueline &&echo 'source ~/trueline/trueline.sh' >> ~/.bashrc

;;
#####################################quit######################################################################################
"Quit")
   break
   ;;
   
   
*) 
echo "invalid option";
;;

    esac
done
