#!/usr/bin/perl

#This program sums the numbers from input and displays them on screen

#For the splitting of the files I used the command 
#'cut -f 1 ex1.dat>c1.dat'
#'cut -f 2 ex1.dat>c2.dat'
#'cut -f 3 ex1.dat>c3.dat'
#Thus creating three new files, to feed to the program
#to feed the program i type in the CMD line 'perl ex4.pl<'

$sum eq 0;	#defines $sum as zero. Straw Perl won't take '$sum = 0'
$var = <STDIN>;	#the input
chomp $var;
while (defined $var){	#as long as $var is defined, the loop runs
	chomp $var;
	$res = $sum + $var;	#adding $sum and the input and defines it as $res
	$sum = $res;	#defining $res as $sum
	$var = <STDIN>;	#new input
}

print "Sum of lines: $sum\n";






