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
mkdir -p working/people
mkdir -p working/pubs

echo " -- gathering information from .prl directories -- "
for u in `cat content/usernames`; do
    if [ -e /home/$u/.prl/bio.ss ] ; then   cp /home/$u/.prl/bio.ss     working/people/$u.bio.ss ; fi
    if [ -e /home/$u/.prl/pubs.ss ] ; then  cp /home/$u/.prl/pubs.ss    working/pubs/$u.pubs.ss  ; fi
    if [ -e /home/$u/.prl/pubs.bib ] ; then cp /home/$u/.prl/pubs.bib   working/pubs/$u.pubs.bib ; fi
    if [ -d /home/$u/.prl/static ] ; then   cp -r /home/$u/.prl/static  output/static-$u         ; fi
done

cp content/centralized-people/* working/people/
cp content/centralized-pubs/* working/pubs/

cp -r content/centralized-pics output/gallery

if [ -e working/pubs/allpubs.bib ] ; then  rm working/pubs/allpubs.bib; fi
cat working/pubs/*.bib > working/pubs/allpubs.bib

cp allpubs.aux working/pubs/
cp sxml.bst working/pubs/

echo " -- building publication information -- "
cd working/pubs/
mzscheme ../../xml-to-sxml.ss *.xml 2> errorlog
error_check

bibtex allpubs > errorlog
error_check

mv allpubs.bbl bibtexpubs.withbackslashes

#the backslashes get us into trouble otherwise
detex bibtexpubs.withbackslashes > bibtexpubs.ss

cd ../../

echo " -- generating HTML -- "

mzscheme render-html.ss 2> errorlog
error_check

echo " -- done -- "
