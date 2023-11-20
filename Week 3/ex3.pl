!#/usr/bin/perl

#This program count the number of lines in the input and displays the result
#the user may feed a text file into the program and get the line count.

$sum == 0;	#defining $sum, so perl know it is zero
$i = <STDIN>;	
chomp $i;	#User-input and chomping
while (defined ($i)){	#as long as the user-input is defined, the loop runs
	chomp $i;	#chomping off the newline
	$sum++;		#adds 1 to sum for every loop
	$i = <STDIN>;	#ask for next user input
}

print "Lines: $sum\n"; 	#printes number of lines counted

#It should be noted that so far I have discovered that the 'cat' command and
#<ctrl + d> doesn't work in the Strawberry enviroment, so to terminate the 
#line counting program, one have to press <ctrl + c> to terminate and get the 
#line count. If you have have an input file (like in last part of exercise 3)
#it will terminate just fine, with the result 
