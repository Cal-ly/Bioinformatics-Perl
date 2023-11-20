#!/usr/bin/perl -w
use strict;

#This script runs the file 'dna.fsa' and finds all the positions with a start
#codon (ATG)

my $dna;
open (IN, '<', 'dna.fsa') or die "$!\n"; #opens dna.fsa
while (defined (my $line = <IN>)){	#starts loop as long as dna.fsa is defined
	if (substr($line, 0, 1) ne '>'){ #skips every line starting with a '>' 
		chomp $line; 
		$dna .= $line;	#appends every line to $dna, making it one string 
	} 
}
close IN;
my $leng = length($dna);
my $pos = 0;
while ($pos <= $leng){ #loop runs as long as the positions is below or equal the length of the string $dna
	if (substr($dna, $pos, 3) eq 'ATG'){ 
		$pos += 1;
		print "Found ATG at position: $pos \n";
		$pos -= 1;
	}   
	$pos++;
}
#this part moves through all positions taking 3 charecters at a time, and every time
#it matches 'ATG' it will print the position, adjusted to 'human count'.