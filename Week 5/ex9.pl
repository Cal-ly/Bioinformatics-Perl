#!/usr/bin/perl -w
use strict;

#Make a program that asks for an organism, like 'HUMAN' or 'RAT'. 
#The program should then count the number of lines/times a SwissProt 
#identifier in the file orphans.sp is present with said organism, ie. 
#PARG_HUMAN and LUM_HUMAN are the two first (but not last) for HUMAN.

my $first_input = <STDIN>;
chomp $first_input;
my $input = uc($first_input);
my $length_in = length($input);
my $spid = '';
open (IN, '<', 'orphans.sp') or die "$!\n";
while (defined (my $line = <IN>)){
	if (substr($line, 0, 1) ne '>'){
		$spid .= $line;
	}
}
my $count = 0;
my $pos = 0;
my $length1 = length($spid);
while($pos < $length1){
	if (substr($spid, $pos, 1) eq '_'){
		$pos++;
		if (substr($spid, $pos, $length_in) eq "$input"){
			$count++;
		}
	}
	elsif(substr($spid, $pos, 1) ne '_'){
		$pos++;
	}
}

print "Found $count entries for $first_input\n";
close IN;