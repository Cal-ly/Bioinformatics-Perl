#!/usr/bin/perl -w
use strict;

my $file = <STDIN>;
chomp $file;
#my $sq = 0;
my $i = 0;
open (IN, '<', "$file") or die "$!\n";
while (defined (my $line = <IN>)) {
	if (substr($line, 0, 5) eq '     ') {
		for (substr($line, $i, 1); $line<=length($line); $i++) {
			if (substr($line, $i, 1) ne ' ') {
				print substr($line, $i, 1);
			}
		}	
	}
}
#print "$sq \n";
close IN;
