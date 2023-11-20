#!/usr/bin/perl -w
use strict;

#This program searches from one end to the other for an accession number, specified by the user
my $list;
my @acc = ();
#opening file and sends it to an array @acc
open(IN, '<', 'clean.acc') or die "$!";
while (defined ($list = <IN>)){
	chomp $list;
	push(@acc, $list);
}
close IN;

my $ac = 0;
while($ac ne 'STOP'){
	print "Enter accession number or STOP to stop: ";
	$ac = <STDIN>;
	chomp $ac;
	my $comparison;
	my $pos = 0;
	my $flag = 0;
	while($pos < (scalar @acc)){ #runs as long as $pos is less than the scalar value of @acc
		$comparison = $acc[$pos];
		if($comparison eq $ac){ #compares input to the currently iterated item
			my $list_pos = $pos + 1; #for "human count" purposes
			print "$ac found at position $list_pos\n";
			$flag = 1; #if query is found, flag will be 'raised'
		}
		$pos++;
	}
	if ($flag == 0){ #if flag is not raised
		if($ac ne 'STOP'){	#and if input is not STOP
			print "$ac not found\n"; #inquery is not found message will be displayed
		}
	}
}