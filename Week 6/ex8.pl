#!/usr/bin/perl -w
use strict;

#this program opens a file from the commandline and cuts the columns and printes
#them in the order that is specified like 'perl ex8.pl 3 1 2 ex1.dat'

my @cut = ();
my $file = $ARGV[$#ARGV]; #takes the last argument and send it to the filehandle
open(IN, '<', $file) or die "Could not open $!";
while (defined (my $list = <IN>)) {
	chomp $list;
	push(@cut, $list);
}
close IN;

my $inputs = scalar @ARGV; #Hides the number of inputs from the argument vector

if ($inputs <= 1) { #if one or zero arguments received, error message prints
		print "Not enough arguments recived\n";
}
else{
	for (my $i = 0; $i < scalar @cut; $i++){ # scalar printes to last position
		my $spliced = splice(@cut, $i, 1); # splices out one "line" of data into $spliced
		my @cutted = split("\t", $spliced); # splits the chunk where it is seperated by tab
		# if statements		
		if ($inputs eq 2) {
			my $pos0 = $ARGV[0] - 1;	# which position of the column should be first
			print $cutted[$pos0], "\n";
		}
		elsif ($inputs eq 3) {
			my $pos0 = $ARGV[0] - 1;	# which position of the column should be first
			my $pos1 = $ARGV[1] - 1;	# which position of the column should be second
			print $cutted[$pos0], "\t", $cutted[$pos1], "\n";
		}
		elsif ($inputs eq 4) {
			my $pos0 = $ARGV[0] - 1;	# which position of the column should be first
			my $pos1 = $ARGV[1] - 1;	# which position of the column should be second
			my $pos2 = $ARGV[2] - 1;	# which position of the column should be three
			print $cutted[$pos0], "\t", $cutted[$pos1], "\t", $cutted[$pos2], "\n";
		}	
	}
}