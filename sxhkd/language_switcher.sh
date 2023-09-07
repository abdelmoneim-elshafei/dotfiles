layout=$(setxkbmap -query |grep -e layout: |cut -c 13-14)

if [[ $layout == "us" ]]; then

setxkbmap -layout ara
#notify-send "Language" "Arabic"

elif [[ $layout == "ar" ]]; then
#notify-send "Language" "English"
setxkbmap -layout us

fi