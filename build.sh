
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