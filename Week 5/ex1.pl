#!/usr/bin/perl -w
use strict;

my $file = <STDIN>;
open (IN, '|-', "less $file") or die"$!";
close IN;
