#/bin/bash
SOURCE="/dev/video5"
echo "----------------------------------------"
echo "!Please select your audio from the list!"
echo "----------------------------------------"
echo ""
files=$(ls ~/bin/envmic/audio/*.mp3)
i=1

for j in $files
do
echo "$i.$j"
file[i]=$j
i=$(( i + 1 ))
done
echo "----------------------------------------"
echo "!Exit with.............................!"
echo "! >> Strg c << BEFORE..................!"
echo "!you enter a number....................!"
echo "!......................................!"
echo "!Restart wit...........................!"
echo "! >> Strg c << AFTER...................!"
echo "!you enter a number....................!"
echo "----------------------------------------"
echo ""
echo "----------------------------------------"
echo "!Make sure to disable the mic..........!"
echo "!before selecting a new audio..........!"
echo "----------------------------------------"
echo ""
echo "----------------------------------------"
echo "!Type in the number of the audio.......!"
echo "----------------------------------------"
echo ""
read input
echo "----------------------------------------"
echo "!You select the audio..................!" 
echo ">> ${file[$input]} <<"
echo "----------------------------------------"
echo ""
echo "----------------------------------------"
echo "!Broadcasting.(maybe use firefox)......!"
echo "----------------------------------------"
echo ""
echo "would you use your envmic and start streaming your selected audio?"
echo "normal (n) | soft (s) | half (h) | loud (l) | no (o)"
read -n 1 -p "" ans;
case $ans in
    n|normal|N|0)
        ffmpeg -re -i ${file[$input]} -f s16le -ar 16000 -ac 1 -filter:a loudnorm - > /tmp/virtmic;;
    s|soft|S|1)
        ffmpeg -re -i ${file[$input]} -f s16le -ar 16000 -ac 1 -filter:a "volume=0.10" - > /tmp/virtmic;;
    h|half|H|2)
        ffmpeg -re -i ${file[$input]} -f s16le -ar 16000 -ac 1 -filter:a "volume=0.5" - > /tmp/virtmic;;
    l|loud|L|3)
        ffmpeg -re -i ${file[$input]} -f s16le -ar 16000 -ac 1 -filter:a "volume=1.5" - > /tmp/virtmic;;
    o|no|N|4)
        echo " > thank you for using envmic :)"; exit;;
esac
echo "----------------------------------------"
echo "!feel free to restart the script.......!"
echo "----------------------------------------"
echo ""
./envmic.sh
