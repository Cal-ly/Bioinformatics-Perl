#!/usr/bin/perl

=pod
now make a new one that calculates the mean value of the columns. 
Also create a file with the numbers 9-1 and feed that to the program.
=cut

$sum eq 0;	#defines $sum as zero. Straw Perl won't take '$sum = 0'
$line eq 0;
$var = <STDIN>;	#the input
chomp $var;
while (defined $var){	#as long as $var is defined, the loop runs
	chomp $var;
	$res = $sum + $var;	#adding $sum and the input and defines it as $res
	$sum = $res;	#defining $res as $sum
	$line++;	#each time a loop has run, +1 will be added to $line
	$var = <STDIN>;	#new input
}

$ave = $sum/$line;

print "Average of lines: $ave\n";
