#!/usr/bin/perl -w
use strict;

my $file = <STDIN>;
my $id = 0;
chomp $file;
open (IN, '<', "$file") or die "$!\n";
while (defined (my $line = <IN>)) {
	if (substr($line, 0, 2) eq 'ID') {
		my $i = 0;
		my $j = 5;		
		while (substr($line, $j, 1) ne ' ') {
			$i++;
			$j++;
		}
		$id = substr($line, 5, $i);
		print "SwissProt ID: $id \n";
	}
}
close IN;

