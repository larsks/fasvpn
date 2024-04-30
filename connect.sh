#!/bin/bash

tmpfile=$(mktemp /tmp/vpnXXXXXX)
trap 'rm -f $tmpfile' EXIT

env | grep VPN

cat >"$tmpfile" <<EOF
$VPN_PASSWORD
$VPN_PIN
EOF

openconnect https://vpn.rc.fas.harvard.edu --allow-insecure-crypto --background --user "$VPN_USERNAME" --passwd-on-stdin <"$tmpfile" &&
	exec squid --foreground
