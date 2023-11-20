#!/usr/bin/perl -w
use strict;

#This program cleans the list of file ex5.acc from duplicates

my $list;
my @acc = ();
#opens ex5.acc and sends it to an array @acc
open(IN, '<', 'ex5.acc') or die "$!\n";
while (defined ($list = <IN>)){
	push(@acc, $list);
}
close IN;

@acc = sort @acc; #sorts @acc

my $clean;
while(scalar @acc - 1){ #while the scalar is defined
	my $first = $acc[0];
	my $sec = $acc[1];
	if($first ne $sec){ 
		$clean .= shift(@acc); #if $first and $sec is not the same, it will be send to $clean
	}
	else{
		shift(@acc); #otherwise it will 'shift' it off, thus removing it form the array
	}
}
$clean .= shift(@acc);

open(OUT, '>', 'clean.acc') or die "Could not create file";
print OUT $clean;
close OUT; 
