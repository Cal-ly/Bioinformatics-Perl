#!/usr/bin/perl

#Now write the DNA in the file revdna.dat. Make it look nice, just like dna.dat, 
#ie 60 letters per line.

#this program takes reversed DNA from ex5.pl printes it to revdna.dat
#with 60 characters per line.

$num = 0;
$num_sta = 0;
$num_end = 59;
open(FILE1, '<', 'dna.rev') or die "Error $!\n";


while (defined ($line = <FILE1>)){
	$str_length = length($line)
	for ($num = $num_sta; $num <= $num_end; $num++){
		$dna .= substr ($line, $num, 1);
	}
	$dna .= "\n";
	$num_sta += 61;
	$num_end += 61;
}


print "$dna\n";	
close FILE1;
open(FILE2, '>', 'revdna.dat') or die "Can not create revdna.dat: $!";
print FILE2 $dna;
close(FILE2); 
