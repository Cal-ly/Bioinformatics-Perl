#!/usr/bin/perl -w
use strict;

#This program searches for entries for a user defiend organisme and
#returns the number of entries found. It is NOT case sensitiv.

print "Enter an organisme e.g. human or rat: ";
my $first_input = <STDIN>;
chomp $first_input;
my $input = uc($first_input);
my $length_in = length($input);
my $spid = '';
open (IN, '<', 'orphans.sp') or die "$!\n";
while (defined (my $line = <IN>)){
	if (substr($line, 0, 1) ne '>'){
		$spid .= $line; #sends all the lines not starting with '>' to a $spid
	}
}
my $count = 0;
my $pos = 0;
my $length1 = length($spid);
while($pos < $length1){
	if (substr($spid, $pos, 1) eq '_'){ #when the loop finds a '_' it will move on
		$pos++;							#and match the user input to an equal length 
		if (substr($spid, $pos, $length_in) eq "$input"){ #substring and add one to 
			$count++;	#$count if it matches
		}
	}
	elsif(substr($spid, $pos, 1) ne '_'){
		$pos++;	#else it just skips on
	}
}
print "Found $count entries for $first_input\n";
close IN;