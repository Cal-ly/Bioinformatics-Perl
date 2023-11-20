#!/usr/bin/perl -w
use strict;

#This program cleans the list of file ex5.acc from duplicates

my $list;
my $newlist;
my @acc = ();
#opens ex5.acc and sends it to an array @acc
open(IN, '<', 'ex5.acc') or die "$!\n";
while (defined ($list = <IN>)){
	push(@acc, $list);
}
close IN;

@acc = sort @acc; #sorts @acc

my $clean;
my $i;
while(defined (scalar @acc)){ #if the valuw
	$i = shift(@acc);
	if($i ne shift(@acc)){
		$clean .= unshift(@acc);
	}
	elsif($i eq shift(@acc)){
		shift(@acc);
	}
}

open(OUT, '>', 'clean.acc') or die "Could not create file";
print OUT $clean;
close OUT; 
