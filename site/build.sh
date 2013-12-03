#!/bin/bash

MAINTAINER=schuster
MAINTAINER_EMAIL=${MAINTAINER}@ccs.neu.edu

# Temporary fix until the 64-bit Racket issue is fixed, or login is updated to be 64-bit
PATH=/proj/racket/bin:$PATH

if [ `whoami` != $MAINTAINER ] ; then
	echo "You probably shouldn't run this if you're not $MAINTAINER."
	echo "(I haven't thought through the consequences of other"
	echo "people owning generated files in output/ and working/)"
	exit 1
fi

function error_check() {
    if [ $? != 0 ] ; then 
        RECIPIENT=`./error_blamer.pl errorlog`;
        BACKTRACE=`cat errorlog`;

        mail -s "PRL website generation error" $MAINTAINER_EMAIL <<EOF
Also mailed (if anyone): $RECIPIENT

$BACKTRACE
EOF

        if [ "$RECIPIENT" != "" ] ; then
            mail -s "PRL website generation error" $RECIPIENT <<EOF
[this message is automatically generated]

The most recent attempt to regenerate the PRL website errored out, and it
appears that you're responsible.  If you're not, or you don't know what to do to
fix it, please email $MAINTAINER_EMAIL.

$BACKTRACE
EOF
        fi

        echo " -- [[[error]]] -- "
        cat errorlog
        echo " -- -- -- -- -- -- "
        exit;
    fi
}

function on_exit() {
    chmod -R a+wr output/static*
    chmod -R a+wr output/*.html
    chmod -R a+w working/*
}

trap on_exit EXIT


mkdir -p output

rm -r working/*
mkdir -p working/people
mkdir -p working/pubs


# gather information from .prl directories
for u in `cat content/usernames`; do
    if [ -e /home/$u/.prl/bio.ss ] ; then   cp /home/$u/.prl/bio.ss      working/people/$u.bio.ss ; fi
    if [ -e /home/$u/.prl/pubs.ss ] ; then  cp /home/$u/.prl/pubs.ss     working/pubs/$u.pubs.ss  ; fi
    if [ -e /home/$u/.prl/pubs.bib ] ; then cp /home/$u/.prl/pubs.bib    working/pubs/$u.pubs.bib ; fi
    if [ -e /home/$u/.prl/bio.rkt ] ; then  cp /home/$u/.prl/bio.rkt     working/people/$u.bio.rkt ; fi
    if [ -e /home/$u/.prl/pubs.rkt ] ; then cp /home/$u/.prl/pubs.rkt    working/pubs/$u.pubs.rkt  ; fi
    mkdir -p output/static-$u/
    if [ -d /home/$u/.prl/static ] ; then   cp -r /home/$u/.prl/static/* output/static-$u/        ; fi
done

cp content/centralized-people/* working/people/
cp content/centralized-pubs/* working/pubs/

cp -r content/centralized-pics output/gallery

if [ -e working/pubs/allpubs.bib ] ; then  rm working/pubs/allpubs.bib; fi
cat working/pubs/*.bib > working/pubs/allpubs.bib

cp allpubs.aux working/pubs/
cp sxml.bst working/pubs/

# building publication information
cd working/pubs/
mzscheme ../../xml-to-sxml.ss *.xml 2> errorlog
error_check

bibtex allpubs > errorlog
error_check

mv allpubs.bbl bibtexpubs.withbackslashes

#(the backslashes get us into trouble otherwise)
detex bibtexpubs.withbackslashes > bibtexpubs.ss

cd ../../

# generating HTML

mzscheme render-html.ss 2> errorlog
error_check

cp -r static output/


