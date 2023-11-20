#!/usr/bin/perl -w
use strict;

#You have made a program (let's call it the X-program), which as input takes a file of accession numbers, start10.dat and 
#produces some output, which is in res10.dat. Now you count the lines in your input file and your output file and you 
#discover that the line numbers do not match. Horror - your program does not produce output for some input. 
#Now the assignment is to discover which accession numbers did not produce output. This can be done in various ways, 
#but now you have to use a hash (as look-up table). Print the results.

my @start10 = ();
open(IN1, '<', 'start10.dat') or die "could not open file: $!\n";
while(defined (my $line = <IN1>)) {
	chomp $line;
	@start10 = $line;
}

my @res10 = ();
open(IN2, '<', 'res10.dat') or die "could not open file: $!\n";
while (defined (my $line = <IN2>)) {
   chomp $line;
   my @row = split("\t", $line);
   push(@res10, $row[1]);
} #this cuts out all the acc numbers in the result file
#print @res10;

#Now I got two arrays, @start10 as the 'input' and @res10 as the 'output'

