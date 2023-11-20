#!/usr/bin/perl -w
use strict;

open(IN,'<', 'datafile.txt') or die "$!";
my $flag = 0;
my $data = '':
while (defined (my $line = <IN>)){
	$flag = 1 if $line eq "GREEN\n";
	$data .= $line if $flag == 1;
	$flag = 0 if $line eq "RED\n";
}
close IN;