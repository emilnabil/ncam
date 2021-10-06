#!/bin/sh

##setup command=wget https://raw.githubusercontent.com/emilnabil/ncam/main/installer.sh -O - | /bin/sh
#
echo " download and install emu ncam "

version=11.90
OPKGINSTALL=opkg install --force-overwrite
MY_URL="https://raw.githubusercontent.com/emilnabil/ncam/main"
MY_IPK="ncam_11.90_all.ipk"
MY_DEB="ncam_11.90_all.deb"
##############################################################################
# remove old emu #
opkg remove enigma2-plugin-softcams-ncam

#################################################################################

# Download and install plugin #

cd /tmp 

set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		apt-get install --reinstall ncam_11.90_all.deb -y
	else
		opkg install --force-reinstall ncam_11.90_all.ipk
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























