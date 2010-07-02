#!/bin/bash

MAINTAINER=pauls@ccs.neu.edu

function error_check() {
    if [ $? != 0 ] ; then 
        mail -s "PRL website generation error" $MAINTAINER < errorlog
        echo " -- [[[error]]] -- "
        cat errorlog
        echo " -- -- -- -- -- -- "
        exit;
    fi
}

mkdir -p output

echo " -- gathering information from .prl directories -- "
for u in `cat content/usernames`; do
    if [ -e /home/$u/.prl/bio.ss ] ; then
        cp /home/$u/.prl/bio.ss     content/people/$u.bio.ss
    fi
    if [ -e /home/$u/.prl/pubs.ss ] ; then
        cp /home/$u/.prl/pubs.ss    content/pubs/$u.pubs.ss
    fi
    if [ -e /home/$u/.prl/pubs.bib ] ; then
        cp /home/$u/.prl/pubs.bib   content/pubs/$u.pubs.bib
    fi
    if [ -d /home/$u/.prl/static ] ; then
        cp -r /home/$u/.prl/static  output/static-$u
    fi
done

cp content/centralized-people/* content/people/
cp content/centralized-pubs/* content/pubs/

cp -r content/centralized-pics output/gallery

cat content/pubs/*.bib > working/allpubs.bib
cp allpubs.aux working/
cp sxml.bst working/

echo " -- building publication information -- "

cp content/pubs/*.xml working/
cp content/pubs/*.ss  working/

cd working/
mzscheme ../xml-to-sxml.ss *.xml 2> errorlog
error_check

bibtex allpubs 2> errorlog
error_check

mv allpubs.bbl bibtexpubs.withbackslashes

#the backslashes get us into trouble otherwise
detex bibtexpubs.withbackslashes > bibtexpubs.ss

cd ../

echo " -- generating HTML -- "

mzscheme render-html.ss 2> errorlog
error_check

echo " -- done -- "