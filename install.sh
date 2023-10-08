#!/bin/bash
shopt -s expand_aliases
alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'


echo "Installing Protontricks"
flatpak --system install com.github.Matoking.protontricks -y
flatpak override --user --filesystem=/run/media/mmcblk0p1 com.github.Matoking.protontricks
echo

echo "Downloading & Installing .NET Desktop 6.0 Runtimes"
protontricks 39150 dotnetdesktop6 &> /dev/null
echo

echo "Downloading Echo-S 8 Installer"
curl -#SL -o "EchoS8.tmp.exe" "https://download.tsunamods.com/?id=10"
echo

echo "Launching Echo-S 8 Installer"
protontricks-launch --appid 39150 EchoS8.tmp.exe &> /dev/null
rm EchoS8.tmp.exe
echo

echo "Done! Launch Final Fantasy VIII to select mods."
echo "Press enter to exit."
read
kill -9 $PPID