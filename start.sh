#bin/bash
echo "----------------------------------------"
echo "!For set up vcam - you need sudo.......!" 
echo "----------------------------------------"
echo ""
pactl load-module module-pipe-source source_name=virtmic file=/tmp/virtmic format=s16le rate=16000 channels=1
echo "----------------------------------------"
echo "Perfect - vmic is set up...............!"
echo "----------------------------------------"
echo ""
echo "Would you like start" 
echo "audio-streaming?"
echo "yes (y) | no (n)"
read -n 1 -p "" ans;
case $ans in
    y|yes|Y|1)
        ./envmic.sh;;
    n|no|N|2)
        echo " > thank you for using envmic :)"; exit;;
esac
