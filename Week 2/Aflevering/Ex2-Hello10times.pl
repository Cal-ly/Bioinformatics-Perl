#!/usr/bin/Perl

# This script printes "Hello world" ten times

$i = 1; 			#The integer statement
while ($i <= 10){		#See "Note 1"
	print "Hello world\n";	#Each loop will print Hello world
	$i += 1;		#Adds + 1 to our integer, closing the loop when 				
};				#$i = 11

#Note 1: The condition for our "while"-loop is that as long as 10 is greater or 
#equal to our integer, the loop will run.  
