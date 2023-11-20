#!/usr/bin/perl

#This program acts as a simple calculator, with user-input for integers and what
#operation the user wants to run

print 'First integer: ';
$v1 = <STDIN>;
print 'Second integer: ';
$v2 = <STDIN>;
print 'Chose either + - * /';
print "\nOperation: ";
$op = <STDIN>;

#Now we have a user-defined input, with a little guide to the user on screen, on
#what the user should type as input.

chomp $v1;
chomp $v2;
chomp $op;

#Ensures that we only will have our varibles pipelined further.

if ($op eq '+') {		#If our $op vaiable equals +, the program will
	$res = $v1 + $v2;	#add the two integers.
}
elsif ($op eq '-') {		#If our $op vaiable equals -, the program will
	$res = $v1 - $v2;	#substract the last $v2 from $v1
}
elsif ($op eq '*') {		#If our $op vaiable equals *, the program will
	$res = $v1 * $v2;	#multiply the two integers
}
elsif ($op eq '/') {		#If our $op vaiable equals /, the program will
	$res = $v1 / $v2;	#divide the $v1 with $v2
}


print "Result: $res";		#printes result on screen
