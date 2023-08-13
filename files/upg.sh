#! /bin/bash

# Mise a jour des dpkg sur architecture ARM
if [ $(dpkg --print-architecture) = arm64 ]; then
	echo " "
	echo "Updating dpkg packages:"
	echo "-----------------------"
	echo " "
	sudo apt update
	sudo apt dist-upgrade -y
	sudo apt autoremove -y
	sudo apt clean
fi

# Mise a jour des dpkg sur architecture AMD
if [ $(dpkg --print-architecture) = amd64 ]; then
	# Installe nala si necessaire
	if [ ! -f /usr/bin/nala ]; then
		echo " "
		echo "Installing nala package manager:"
		echo "--------------------------------"
		echo " "
		echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
		wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
		sudo apt update
		sudo apt install -y nala
	fi
	# Utilise nala pour mettre a jour les dpkg
	echo " "
	echo "Updating dpkg packages:"
	echo "-----------------------"
	echo " "
	sudo nala upgrade -y
fi

# Mise a jour des flatpak si le systeme en utilise
if [ -f /usr/bin/flatpak ]; then
	echo " "
	echo "Updating flatpak packages:"
	echo "--------------------------"
	echo " "
	flatpak update -y
	flatpak uninstall -y --unused
fi

# Mise a jour des snap si le systeme en utilise
if [ -f /usr/bin/snap ]; then
	echo " "
	echo "Updating snap packages:"
	echo "--------------------------"
	echo " "
	sudo snap refresh
fi


