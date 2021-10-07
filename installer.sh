#!/bin/sh

##setup command=wget https://raw.githubusercontent.com/emilnabil/ncam/main/installer.sh -O - | /bin/sh
#
echo " download and install emu ncam "

version=12.0
OPKGINSTALL=opkg install --force-overwrite
MY_URL="https://raw.githubusercontent.com/emilnabil/ncam/main"
MY_IPK="enigma2-plugin-softcams-ncam_12.0.ipk"
MY_DEB="enigma2-plugin-softcams-ncam_12.0.deb"
##############################################################################
# remove old emu #
opkg remove enigma2-plugin-softcams-ncam

#################################################################################
# Remove previous files #
cd /tmp

rm -rf * > /dev/null 2>&1

# Download and install plugin #

set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		apt-get install --reinstall $MY_DEB -y
	else
		opkg install --force-reinstall $MY_IPK
	fi
echo "================================="
set +e
chmod 755 /usr/bin/ncam
cd ..
wait
rm -f /tmp/$MY_IPK
rm -f /tmp/$MY_DEB
	if [ $? -eq 0 ]; then
echo ">>>>  SUCCESSFULLY INSTALLED <<<<"
fi
		echo "********************************************************************************"
echo "   UPLOADED BY  >>>>   EMIL_NABIL "   
sleep 4;
		echo '========================================================================================================================='
##########################################                                                                                                                  
echo " your Device Will RESTART NOW " 
echo "**********************************************************************************"
wait
init 4
init 3
exit 0


























