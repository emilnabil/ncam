#!/bin/sh

##setup command=wget https://raw.githubusercontent.com/emilnabil/ncam/main/installer.sh -O - | /bin/sh
#
echo " download and install emu ncam "

version=12.4
OPKGINSTALL=opkg install --force-overwrite
MY_URL="https://raw.githubusercontent.com/emilnabil/ncam/main"
MY_IPK="enigma2-plugin-softcams-ncam_12.4-r0_all.ipk"
MY_DEB="enigma2-plugin-softcams-ncam_12.4-r0_all.deb"
##############################################################################
# remove old emu #
opkg remove enigma2-plugin-softcams-ncam

#################################################################################
echo " install libcur "
opkg install libcurl4

# Remove previous files #
cd /tmp

rm -rf * > /dev/null 2>&1

# Download and install plugin #

set -e
     wget "$MY_URL/$MY_IPK"
  wait
     wget "$MY_URL/$MY_DEB"

 if which dpkg > /dev/null 2>&1; then
		dpkg -i --force-overwrite $MY_DEB; apt-get install -f -y
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
###########################################                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo "**********************************************************************************"
wait
killall -9 enigma2
exit 0




































