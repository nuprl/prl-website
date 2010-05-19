#!/bin/bash

echo " -- gathering information from .prl directories -- "
echo "cp will fail to find everything it wants in ~/.prl directories now.  This is normal."
for u in `cat content/usernames`; do
    cp /home/$u/.prl/bio.ss     content/people/$u.bio.ss
    cp /home/$u/.prl/pubs.ss    content/pubs/$u.pubs.ss
    cp /home/$u/.prl/pubs.bib   content/pubs/$u.pubs.bib
    cp -r /home/$u/.prl/static  output/static-$u
done

cp content/centralized-people/* content/people/
cp content/centralized-pubs/* content/pubs/

cp -r content/gallery output/gallery

cat content/pubs/*.bib > working/allpubs.bib
cp allpubs.aux working/
cp sxml.bst working/

echo " -- building publication information -- "

cp content/pubs/*.xml working/
cp content/pubs/*.ss  working/

cd working/
mzscheme ../xml-to-sxml.ss *.xml

bibtex allpubs
mv allpubs.bbl bibtexpubs.withbackslashes

#the backslashes get us into trouble otherwise
detex bibtexpubs.withbackslashes > bibtexpubs.ss

cd ../

echo " -- generating HTML -- "

mzscheme render-html.ss

echo " -- done -- "