#!/usr/bin/perl

#This script ask for a low integer and a high integer, then it displays every
#number between the lowest and highest integer, both included.

print "Lowest integer input: "; 
$i1 = <STDIN>;
print "Higest integer input: ";
$i2 = <STDIN>;

#Here we have the interface ask for two integers via user input

chomp $i1;
chomp $i2;

#making sure we only have our variables left, by chomping everything eles off

while ($i1 <= $i2) {	#Condition: loop should run as long as $i1 is less or eq
	print "$i1\n";	#The we print $i1 every time we have run a loop
	$i1 += 1;	#adding +1 to $i1, ensuring the loop will stop
}

