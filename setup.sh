# #!/bin/bash

## Awesome Banner
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
WHITE=$(tput setaf 7)
NC=$(tput sgr0)

echo ""

echo "${GREEN}##########################################${NC}"
echo "${GREEN}███████╗███████╗████████╗██╗   ██╗██████╗${NC}"
echo "${GREEN}██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗${NC}"
echo "${GREEN}███████╗█████╗     ██║   ██║   ██║██████╔╝${NC}"
echo "${GREEN}╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝${NC}" 
echo "${GREEN}███████║███████╗   ██║   ╚██████╔╝██║${NC}"     
echo "${GREEN}╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝${NC}"
echo "${WHITE} \t\t\t v1.2 ${NC}"          
echo "${WHITE} \t\t\t @LzM17_B4Ha  ${NC}"        
echo "${GREEN}##########################################${NC}"                                           


## Contents ##
#  0. Greetings
#  1. Install zsh
#  2. Install Powerlevel10k -A Zsh theme
#  3. Install Visual Studio Code
#  4. Install google chrome
#  5. To be Added manually
#
#

#### GREETINGS
## get current hour (24 clock format i.e. 0-23)
hour=$(date +"%H")

# if it is midnight to mid-afternoon will say G'morning
if [ $hour -ge 0 -a $hour -lt 12 ]; then
    greet="Good Morning $USER 👋, please wait as we install the configs, ❤️ Hydra"
# if it is mid-afternoon to evening ( before 6 pm) will say G'noon
elif [ $hour -ge 12 -a $hour -lt 18 ]; then
    greet="Good Afternoon $USER 👋, please wait as we install the configs, ❤️ Hydra"
else # it is good evening till midnight
    greet="Good evening $USER 👋, please wait as we install the configs, ❤️  Hydra"
fi


# display greet
echo ""
echo $greet
echo ""

if [ $(id -u) -ne 0 ]; then

    # you are root Add on top "$(grep '^sudo:.*$' /etc/group | cut -d: -f4)" == "root"
    echo "You have sudo privileges ✅"
    echo""
    echo "Starting Script ....."
else
    # you are not root
    echo "⚠️  You need to be root to run this script !"
    #Call to terminate the script
    exit 1
fi

echo ""

# Install zsh
echo "Installing Zsh Shell"
sudo apt install -y zsh zsh-syntax-highlighting zsh-autosuggestions
chsh --shell /bin/zsh root

# ### Install Powerlevel10k -A Zsh theme
echo "Installing powerlevel10k ...."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>! ~/.zshrc
source ~/.zshrc
echo "Done  👍"
echo ""

# ## Installing Visual Studio Code
echo "Installing Visual Studio Code ...."
sudo apt update
sudo apt install software-properties-common apt-transport-https curl
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
code

# Install go and fuzzing tools gobuster and ffuf
echo "Installing Go ...."
cd /tmp
wget https://dl.google.com/go/go1.14.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.14.4.linux-amd64.tar.gz
cd
echo "export PATH=$PATH:/usr/local/go/bin:/root/go/bin" >> ~/.zshrc
source ~/.zshrc

# # ## CHECK FOR ROOT

# # if [ "$(whoami)" == "root" ]; then
# #     # you are root
# #     echo "Hail hydra, You are root"
# # else
# #     # you are not root
# #     echo "You're not root"
# # fi

# # Create update/upgrade shortcut
echo "sudo apt-get upgrade && sudo apt-get update" >>Apt && sudo chmod +x Apt && sudo mv Apt /usr/bin/

# Add USER Defined PATHS to ~/.zshrc
echo "Add USER Defined PATHS to ~/.zshrc ...."
echo"" >> ~/.zshrc
echo " alias ..='cd ..' " >>~/.zshrc
echo " alias ...='cd ../..' " >>~/.zshrc
echo " alias grep='egrep --color -i ' " >>~/.zshrc
echo " alias serve='python3 -m http.server' " >>~/.zshrc
echo " alias wanip='dig +short myip.opendns.com @resolver1.opendns.com' " >>~/.zshrc

# Tools installation

# Install google chrome
echo "Installing google chrome ...."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo google-chrome --no-sandbox

# Install evil-winrm
echo "Installing evil-winrm ...."
cd /opt/ && sudo gem install evil-winrm

# # Install enum4linux
# echo "Installing enum4linux ...."
# cd /opt/ && sudo apt-get install enum4linux
 
# Install SecLists
echo "Installing SecLists"
cd /opt/ && sudo wget https://github.com/danielmiessler/SecLists/archive/master.zip

# Impacket tools
echo "Installing Impacket tools"
cd /opt/
  sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
  sudo python get-pip.py
  sudo git clone https://github.com/SecureAuthCorp/impacket
  cd impacket
  sudo pip2 -r requirements.txt
  sudo python setup.py install

# Install CrackMapExec
# # echo "Install CrackMapExec"
 sudo apt-get install -y libssl-dev libffi-dev python-dev build-essential
 sudo git clone --recursive https://github.com/byt3bl33d3r/CrackMapExec
 cd CrackMapExec
 pip2 install -r requirements.txt
 sudo python setup.py install

# Installing privilege-escalation-awesome-scripts-suite
echo "Installing privilege-escalation-awesome-scripts-suite"
cd /opt/ && sudo git clone https://github.com/B4Ha-3xp10it/privilege-escalation-awesome-scripts-suite.git && https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/x64/Release/winPEAS.exe
wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.0/pspy64




## To be Added manually

# Add the following to zshrc file (Uncomment)

# # 1.
# # myip() {
# #     echo $(ip a s tun0 | grep -w inet | awk '{print $2}' | awk -F/ '{print $1}')
# # }
