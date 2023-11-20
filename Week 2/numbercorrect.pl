#!/usr/bin/perl

#This script ask for two integers, displays the numbers from the lowest to 
#highest integer, disregarding input order.

print "Integer input: "; 
$i1 = <STDIN>;
print "Integer input: ";
$i2 = <STDIN>;

#The interfaces ask for an integer, which is user-defined

chomp $i1;
chomp $i2;

#Making sure that only the user-input is pipelined on 

if ($i1 > $i2) {	#If the first input integer is the highest, then the
	$high = $i1;	#script will define $i1 as the highest and $i2 as the
	$low = $i2;	#lowest variable
	}
elsif ($i1 < $i2) {	#If the first input integer is the lowest, then the
	$low = $i1;	#script will define $i1 as the lowest and $i2 as the 
	$high = $i1;	#highest variable
}
elsif ($i1 = $i2) {	#if input is the same, error message will be displayed
	print "Error: Same integers";
}
while ($low <= $high) {	#Loop-condition: as long as the lowest integer is less 
	print "$low\n";	#or eq to the highest, THEN it will print the $low vari-
	$low += 1;	#able on the screen and add 1 to $low for every loop
}

