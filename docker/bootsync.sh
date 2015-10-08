#!/bin/sh

sudo umount /Users

grep '\-\-dns' /var/lib/boot2docker/profile || {
	echo 'EXTRA_ARGS="$EXTRA_ARGS --dns 192.168.99.100 --dns 8.8.8.8 --dns 8.8.4.4"' | sudo tee -a /var/lib/boot2docker/profile
}

echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf
