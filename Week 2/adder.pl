#!/usr/bin/perl

#This program will add two user-defined integers and print all three.

print "Type in two numbers, the program will add them together for you\n";

print 'Type first integer: ';
$v1 = <STDIN>; 			#The input for the first integer
print 'type second integer: ';
$v2 = <STDIN>;			#The input for the second integer

chomp $v1;	#Making sure that only the input is sent through the pipeling
chomp $v2;	#Making sure that only the input is sent through the pipeling
$res = ($v1 + $v2); #adds the two integers and defines the result as $res

print 'Result: ';	
print $res;		#Printes the result"
