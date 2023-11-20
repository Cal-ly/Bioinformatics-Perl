#!/usr/bin/perl -w
use strict;

#This program cleans the list of file ex5.acc from duplicates using references

my @acc = ();
open(IN, '<', 'ex5.acc') or die "$!\n";
while (defined (my $list = <IN>)){
	push(@acc, $list);
}
close IN;

my $ref = \@acc; #Sets $ref as a reference to @acc

&cleaner($ref);

open(OUT, '>', 'clean.acc') or die "Could not create file";
print OUT @acc;
close OUT; 

###############
# Subroutines #
###############

sub cleaner {
	my ($ref) = @_;
	@{$ref} = sort @{$ref}; #sorts @acc by $ref
	my $first = 0;
	my $sec = 1;
	while($sec < (scalar @{$ref})) { #while $sec is less than the scalar value of @acc
		if(${$ref}[$first] eq ${$ref}[$sec]) { #if $first and $sec are the same
			splice(@{$ref}, $sec, 1);	#it will be spliced off the array
		}
		else{ #otherwise it will move on
			$first++;
			$sec++;
		}
	}	
}

