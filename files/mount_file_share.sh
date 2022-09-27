#!/bin/bash

sudo mkdir /mnt/${file_share_name}

if [ ! -d "/etc/smbcredentials" ]; then
	sudo mkdir /etc/smbcredentials
fi

if [ ! -f "/etc/smbcredentials/${storage_account_name}.cred" ]; then
	sudo bash -c 'echo "username=${storage_account_name}" >> /etc/smbcredentials/${storage_account_name}.cred'
	sudo bash -c 'echo "password=${storage_account_key}" >> /etc/smbcredentials/${storage_account_name}.cred'
fi

sudo chmod 600 /etc/smbcredentials/${storage_account_name}.cred
sudo bash -c 'echo "//${storage_account_name}.file.core.windows.net/${file_share_name} /mnt/${file_share_name} cifs nofail,credentials=/etc/smbcredentials/${storage_account_name}.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30" >> /etc/fstab'
sudo mount -t cifs //${storage_account_name}.file.core.windows.net/${file_share_name} /mnt/${file_share_name} -o credentials=/etc/smbcredentials/${storage_account_name}.cred,dir_mode=0777,file_mode=0777,serverino,nosharesock,actimeo=30
