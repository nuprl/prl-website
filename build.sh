#!/bin/bash

for u in `cat content/usernames`; do
    cp /home/$u/.prl/bio.ss     content/people/$u.bio.ss
    cp /home/$u/.prl/pubs.ss    content/pubs/$u.pubs.ss
    cp /home/$u/.prl/pubs.bib   content/pubs/$u.pubs.bib
    cp -r /home/$u/.prl/static  output/static-$u
done

cp -r content/gallery output/gallery

cat content/pubs/*.bib > working/allpubs.bib
cp allpubs.aux working/
cp sxml.bst working/

cp content/pubs/*.xml working/
cp content/pubs/*.ss  working/

cd working/
mzscheme ../xml-to-sxml.ss *.xml

bibtex allpubs
mv allpubs.bbl bibtexpubs.withbackslashes

#the backslashes get us into trouble otherwise
detex bibtexpubs.withbackslashes > bibtexpubs.ss

cd ../

mzscheme render-html.ss