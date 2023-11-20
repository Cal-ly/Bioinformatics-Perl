#!/usr/bin/perl -w
use strict;

#After having looked at the list in clean.acc, you discover that the accession numbers 
#are sorted. This means that you can use the much more powerful binary search method. 
#Repeat the previous exercise, but this time use binary search.

#this program implements binary search in contrast to ex 6.5's linear search

#opening file and sends it to an array @acc
my $list;
my @acc = ();
open(IN, '<', 'clean.acc') or die "$!";
while (defined ($list = <IN>)){
	chomp $list;
	push(@acc, $list);
}
close IN;

my $ac_input = 0;
while ($ac_input ne 'STOP'){ #while input is not stop, loop will run
	print "Enter accession number or STOP to stop: ";
	$ac_input = <STDIN>;
	chomp $ac_input;
	$ac_input = uc($ac_input); #corrects to uppercase letters, for user-friendliness
	my $low = 0; 
	my $high = scalar @acc;
	my $flag = 0;
	my $pos_guess = 0;
	my $ac_guess = 1;
	while ($low <= $high and $ac_input ne $ac_guess and $ac_input ne 'STOP'){
		#reduces search interval to either lower or higher
		$pos_guess = int(($high + $low)/2); 
		$ac_guess = $acc[$pos_guess];
		if($ac_input gt $ac_guess){
			$low = $pos_guess + 1; 
		}
		elsif($ac_input lt $ac_guess){
			$high = $pos_guess - 1;
		}
		elsif($ac_input eq $ac_guess){
			my $position = $pos_guess + 1; #Added for corrrect 'human count' index number.
			print "$ac_input found at position $position\n";
		}
	}
	if($ac_input eq 'STOP'){
	print "Search stopped\n";
	}
	elsif($low > $high){ #non-sense interval, the query was not in the file
		print "Could not find $ac_input\n";
	}
}
