#!/usr/bin/perl -w
use strict;

#This script findes any stop codon within the reading frame of the first found 
#start codon ATG. 

my $dna;
open (IN, '<', 'dna.fsa') or die "$!\n";
while (defined (my $line = <IN>)){
	if (substr($line, 0, 1) ne '>'){
		chomp $line;
		$dna .= $line;
	} 
}
close IN;
my $leng = length($dna);
my $pos = 82;	#We assume we start at position 83 and moves 3 positions forward at 
while ($pos <= $leng){	#everytime the loop has run
	if (substr($dna, $pos, 3) eq 'TAA'){
		$pos += 1;
		print "stop-codon at position: $pos \n" and die;
		$pos -= 1;
	}
	elsif (substr($dna, $pos, 3) eq 'TAG'){
		$pos += 1;
		print "stop-codon at position: $pos \n" and die;
		$pos -= 1;
	}
	elsif (substr($dna, $pos, 3) eq 'TGA'){
		$pos += 1;
		print "stop-codon at position: $pos \n" and die;
		$pos -= 1;
	}
	else{
		$pos += 3;
	}
}
#the loop printes and dies when it have found a stop codon within the reading frame 