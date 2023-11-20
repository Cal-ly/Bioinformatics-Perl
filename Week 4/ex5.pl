#!/usr/bin/perl

#This program reverts the DNA after complementing it, so the last letter 
#will be the first and displays it. It will require that the program
#'ex4.pl', so it will read from 'dna.comp'


open(FILE1, '<', 'dna.comp') or die "Error $!\n";
while (defined ($line = <FILE1>)){	
	$str_length = length($line);
	chomp $str_length;	
	for ($num = 1; $num <= $str_length; $num++){	
		$rev .= substr ($line, -$num, 1);
	}
}

print "Reverse string: ";
print "$rev\n";	
close FILE1;
open(FILE2, '>', 'dna.rev') or die "Can not create dna.rev: $!";
print FILE2 $rev;
close(FILE2);

