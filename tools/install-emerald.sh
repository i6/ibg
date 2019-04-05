#!/bin/sh

# This script installs the Emerald CTAN package from
# https://www.ctan.org/tex-archive/fonts/emerald/
# into $TEXMFLOCAL, which is usually /usr/local/share/texmf
#
# This script will download emerald.zip if it's not already present.
# It must be run as root.
#
# Created by David Griffith <dave@661.org>
# Released into the public domain 2016

# Exit values:
#	0	Script completed installation successfully.
#
#	1	Unable to find kpsewhich(1), maybe TeX isn't installed?
#	2	Unable to find unzip(1).
#	3	Script not run as root.
#	4	Unable to download package.
#

EMERALD_URL="http://mirrors.ctan.org/fonts/emerald.zip"
EMERALD_PKG=emerald.zip

PERM=644
DPERM=755
PKGDIR="emerald"
TEXMFLOCAL=`kpsewhich -var-value TEXMFLOCAL`

echo "Emerald CTAN package installer..."

if [ ! $(command -v kpsewhich) ] ; then
	echo "  ** Cannot find kpsewhich!  Is TeX really installed?"
	exit 1
fi

if [ ! $(command -v unzip) ] ; then
	echo "  ** Cannot find unzip!  Please install it and try again."
	exit 2
fi

if [ `ps -o uid= $$` -ne 0 ] ; then
	echo "  ** This script must be run as root"
	exit 3
fi

if [ -f $EMERALD_PKG ] ; then
	echo "Found $EMERALD_PKG right here."
else
	echo "Attempting download from $EMERALD_URL..."
	if [ $(command -v curl) ] ; then
		echo "Downloading $EMERALD_URL using curl."
		command curl -L $EMERALD_URL -o $EMERALD_PKG
	elif [ $(command -v wget) ] ; then
		echo "Downloading $EMERALD_URL using wget."
		command wget $EMERALD_URL -O $EMERALD_PKG
	else
		echo "  ** Neither curl nor wget are present."
		echo "  ** Please download the emerald package manually,"
		echo "  ** put it in this directory, and try again."
		exit 4
	fi
fi

echo "Unpacking $EMERALD_PKG..."
unzip -q $EMERALD_PKG

echo "Installing to $TEXMFLOCAL..."
echo "Making directories..."
install -m $DPERM -d	$TEXMFLOCAL/fonts/afm/emerald \
			$TEXMFLOCAL/fonts/map/dvips \
			$TEXMFLOCAL/fonts/tfm/emerald \
			$TEXMFLOCAL/fonts/type1/emerald \
			$TEXMFLOCAL/fonts/vf/emerald

install -m $DPERM -d	$TEXMFLOCAL/other $TEXMFLOCAL/tex/latex/emerald
install -m $DPERM -d	$TEXMFLOCAL $TEXMFLOCAL/web2c

echo "Installing stuff..."
install -m $PERM -D $PKGDIR/fonts/afm/emerald/* $TEXMFLOCAL/fonts/afm/emerald
install -m $PERM -D $PKGDIR/fonts/map/dvips/emerald.map $TEXMFLOCAL/fonts/map/dvips
install -m $PERM -D $PKGDIR/fonts/tfm/emerald/* $TEXMFLOCAL/fonts/tfm/emerald
install -m $PERM -D $PKGDIR/fonts/type1/emerald/* $TEXMFLOCAL/fonts/type1/emerald
install -m $PERM -D $PKGDIR/fonts/vf/emerald/* $TEXMFLOCAL/fonts/vf/emerald
install -m $PERM -D $PKGDIR/other/* $TEXMFLOCAL/other
install -m $PERM -D $PKGDIR/tex/latex/emerald/* $TEXMFLOCAL/tex/latex/emerald

echo "Map emerald.map" >> $TEXMFLOCAL/web2c/updmap.cfg
mktexlsr $TEXMFLOCAL
updmap-sys

echo "Done!"

exit 0
