#!/bin/sh
USERNAME=$1
useradd -m --shell /usr/bin/bash $USERNAME
su $USERNAME -c "ssh-keygen -t ed25519 -q -f '/home/$USERNAME/.ssh/id_ed25519' -N '' "
su $USERNAME -c "cat '/home/$USERNAME/.ssh/id_ed25519.pub' > '/home/$USERNAME/.ssh/authorized_keys' "
make -C /var/yp
