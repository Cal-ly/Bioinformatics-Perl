#!/usr/bin/perl -w
use strict;

cat ex1.acc | perl -pe 's/HUMAN/RAT/' | less #shifts HUMAN with RAT

cat ex1.acc | perl -ne 'print $_ if $_ =~ m/^P/' | less #printes all the lines begning with 'P'

cat ex1.acc | perl -ne 'print m/^P/' | less #the same as above, but shorter, takes the default

cat ex1.acc | perl -ane 'print "$F[0]\n" if m/^P/' | less #printes all SwissProt ids starting with P
