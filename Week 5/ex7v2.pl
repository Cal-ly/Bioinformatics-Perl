#!/usr/bin/perl -w
use strict;

my $dna;
open (IN, '<', 'dna.fsa') or die "$!\n";
while (defined (my $line = <IN>)) {
	if (substr($line, 0, 1) ne '>') {
		$dna .= substr($line, 0, length($line));
		chomp $dna;
	}
}

print "$dna\n";
close IN;
