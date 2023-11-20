#!/usr/bin/perl -w
use strict;


#This program cleans the list of file ex5.acc from duplicates using splice



my $list;
my @acc = ();
open(IN, '<', 'ex5.acc') or die "$!\n";
while (defined ($list = <IN>)){
	push(@acc, $list);
}
close IN;

@acc = sort @acc; #sorts @acc

my $first = 0;
my $sec = 1;
while($sec < (scalar @acc)){ #while $sec is less than the scalar value of @acc
	if($acc[$first] eq $acc[$sec]){ #if $first and $sec are the same
		splice(@acc, $sec, 1);	#it will be spliced off the array
	}
	else{ #otherwise it will move on
		$first++;
		$sec++;
	}
}	

open(OUT, '>', 'clean.acc') or die "Could not create file";
print OUT @acc;
close OUT; 
