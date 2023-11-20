#!/usr/bin/perl -w
use strict;

#This program calculates the three sums of the three columns in one reading of the 
#file ex1.dat.

my @cut = ();
open(IN, '<', 'ex1.dat') or die "Could not open $!";
while (defined (my $list = <IN>)) {
	chomp $list;
	push(@cut, $list);
}
close IN;

my $scalar = scalar @cut;
my $sum = 0;
for (my $i = 0; $i < $scalar; $i++){ # scalar printes to last position
	my $line = 0;
	my $spliced = splice(@cut, $line, 1); # splices out one "line" of data into $spliced
	my @cutted = split("\t", $spliced); # splits the chunk where it is seperated by tab
	for (my $j = 0; $j <= 2; $j++){ #iterating each chunk and adding them up. 
		$sum += $cutted[$j];
	}
	$line++;
}

print "The sum of all three columns is: $sum\n";
