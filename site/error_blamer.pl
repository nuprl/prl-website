#!/usr/bin/perl

$_ = <> ; #first line

if(m|working/[^/]+/([^.]*)[.].*[.]ss|) {
    print $1;
    exit 0;
} else {
    exit 1;
}
