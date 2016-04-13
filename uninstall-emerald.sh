#!/bin/sh

# This script uninstalls the Emerald CTAN package from $TEXMFLOCAL.
# It may be executed anywhere.

# Created by David Griffith <dave@661.org>
# Released into the public domain 2016

if [ `ps -o uid= $$` -ne 0 ] ; then
	echo "This script must be run as root"
	exit 1
fi

TEXMFLOCAL=`kpsewhich -var TEXMFLOCAL`

echo "Deleting emerald from $TEXMFLOCAL..."

rm -f $TEXMFLOCAL/fonts/map/dvips/emerald.map
rm -rf $TEXMFLOCAL/fonts/afm/emerald
rm -rf $TEXMFLOCAL/fonts/tfm/emerald
rm -rf $TEXMFLOCAL/fonts/type1/emerald
rm -rf $TEXMFLOCAL/fonts/vf/emerald
rm -rf $TEXMFLOCAL/tex/latex/emerald

rm -f $TEXMFLOCAL/other/apicture.ttf \
	$TEXMFLOCAL/other/AUGIE___.INF \
	$TEXMFLOCAL/other/DECAC___.INF \
	$TEXMFLOCAL/other/DECADENC.INF \
	$TEXMFLOCAL/other/DECAIAL_.INF \
	$TEXMFLOCAL/other/DECAI___.INF \
	$TEXMFLOCAL/other/DECAIM__.INF \
	$TEXMFLOCAL/other/DECAITD_.INF \
	$TEXMFLOCAL/other/DECAWTD_.INF \
	$TEXMFLOCAL/other/INTID___.INF \
	$TEXMFLOCAL/other/INTIMACY.INF \
	$TEXMFLOCAL/other/J.D.____.INF \
	$TEXMFLOCAL/other/movieola.inf \
	$TEXMFLOCAL/other/moviettt.inf \
	$TEXMFLOCAL/other/POOKIE__.INF \
	$TEXMFLOCAL/other/SKEETCH_.TTF \
	$TEXMFLOCAL/other/SPANBBI_.INF \
	$TEXMFLOCAL/other/SPANBB__.INF \
	$TEXMFLOCAL/other/SPANBI__.INF \
	$TEXMFLOCAL/other/SPANB___.INF \
	$TEXMFLOCAL/other/Syriac__.inf \
	$TEXMFLOCAL/other/Tallpaul.inf \
	$TEXMFLOCAL/other/TEENSPIR.TTF \
	$TEXMFLOCAL/other/WEBSTER_.INF

sed -i s/Map\ emerald.map//g $TEXMFLOCAL/web2c/updmap.cfg
sed -i '/^$/d' $TEXMFLOCAL/web2c/updmap.cfg
if [ ! -s $TEXMFLOCAL/web2c/updmap.cfg ] ; then
	rm $TEXMFLOCAL/web2c/updmap.cfg
fi

rmdir --ignore-fail-on-non-empty $TEXMFLOCAL/fonts/map/dvips \
				$TEXMFLOCAL/fonts/afm \
				$TEXMFLOCAL/fonts/map \
				$TEXMFLOCAL/fonts/tfm \
				$TEXMFLOCAL/fonts/type1 \
				$TEXMFLOCAL/fonts/vf \
				$TEXMFLOCAL/tex/latex \
				$TEXMFLOCAL/fonts \
				$TEXMFLOCAL/tex \
				$TEXMFLOCAL/other \
				$TEXMFLOCAL/web2c/


mktexlsr $TEXMFLOCAL
updmap-sys
