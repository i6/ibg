#!/bin/sh

# This script installs the Emerald CTAN package from
# https://www.ctan.org/tex-archive/fonts/emerald/
# into $TEXMFLOCAL, which is usually /usr/local/share/texmf
#
# To use, put emerald.zip in the same directory as this script, unzip
# emerald.zip, and execute this script.
#
# Created by David Griffith <dave@661.org>
# Released into the public domain 2016



if [ `ps -o uid= $$` -ne 0 ] ; then
	echo "This script must be run as root"
	exit 1
fi

PERM=644
DPERM=755
PKGDIR="emerald"
TEXMFLOCAL=`kpsewhich -var-value TEXMFLOCAL`

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
