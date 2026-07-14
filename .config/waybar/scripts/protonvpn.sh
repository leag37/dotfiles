#!/bin/fish

# Grab the current status of VPN
set VPN_STATUS (mktemp /tmp/proton-vpn-status-XXXXX)
protonvpn status >> $VPN_STATUS 2> /dev/null

# Fetch status
set STATUS (awk -F ": " '/Status/{print $2}' $VPN_STATUS)
# echo "2 - $STATUS"

set SERVER (awk -f ~/.config/waybar/scripts/proton/server.awk $VPN_STATUS)
# set SERVER (awk -F ": " '/Server/
# {
#   match($2, /[[:alpha:]]+-*[[:alpha:]]+/) 
#   print substr($2, $RSTART, $RLENGTH)
# }' $VPN_STATUS)
# echo "3 - $SERVER"
# cat $VPN_STATUS

# Cleanup
rm $VPN_STATUS

# echo "{\"text\":\"$STATUS ($SERVER)\", \"tooltip\":\"\", \"class\":\"\", \"percentage\":0 }"
printf '{"text":"%s (%s)", "class": "enabled"}\n' "$STATUS" "$SERVER"
