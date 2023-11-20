#!/usr/bin/perl

#This program takes the DNA string in the file 'dna.dat' and converts it
#to the complementary string (A to T and G to C, and vice versa).
#It also creates the file 'dna.comp' and writes the complementary string
#to this file. Removing the double hashtags, will print the original string

$num = 0;
$file = "dna.dat";
chomp $file;
open(FILE1, '<', $file) or die "Error $!\n";
while (defined ($line = <FILE1>)){
	$str_length = length($line);
	chomp $str_length;	
	for ($num = 0; $num <= $str_length; $num++){
		##$dna .= substr($line, $num, 1);
		$comp_line = substr($line, $num, 1);
		if ($comp_line eq 'A'){
		$comp_line = 'T';
		}	
		elsif ($comp_line eq 'T'){
			$comp_line = 'A';
		} 
		elsif ($comp_line eq 'G'){
			$comp_line = 'C';
		} 
		elsif ($comp_line eq 'C'){
			$comp_line = 'G';
		}
		chomp $comp_line;	#turns the file into one string
		$comp_dna .= $comp_line;
	}
}
##print "Input strand: \n";
##print "$dna \n";
print "Complementry strand: \n";
print "$comp_dna\n";
close(FILE1);
open(FILE2, '>', 'dna.comp') or die "Can not create dna.comp: $!";
print FILE2 $comp_dna;
close(FILE2);
