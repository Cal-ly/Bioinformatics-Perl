#!/usr/bin/perl

#This script continues to ask for numbers, as long as they are higher or equal
#to the previous number

print "Base integer input: "; 
$i = <STDIN>;
print "Higher or equal integer input: ";
$j = <STDIN>;

#Our user input 

chomp $i;
chomp $j;

#chomping off everything but the user defined variable

while ($i <= $j){	#Loop condition: $i has to be less or eq to $j
	print "New integer input: ";	
	$new = <STDIN>;	#these two lines ask for a new integer input from user
	chomp $new;	#chomp again
	$i = $j;
	$j = $new;	#these two lines redefine first our $i as $j, then it
}			#redefines $j as $new, which will either close the loop
			#or continue if the newest number is eq or higher
print "Lower integer input than previous, script terminated";

