[ $IPV4_ENABLE = "true"] && { sleep 5; bird -c /usr/local/etc/bird.conf -d || exit 1; }

[ $IPV6_ENABLE = "true" ] && { sleep 5; bird6 -c /usr/local/etc/bird6.conf -d || exit 1; }

# something that keep the container running
tail -f /dev/null
