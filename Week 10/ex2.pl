#!/usr/bin/perl -w
use strict;

#This program returns a clean accession number list, no matter if it is the array or the
#reference to the arrray

my @acc = ();
open(IN, '<', 'ex5.acc') or die "$!\n";
while (defined (my $list = <IN>)){
	push(@acc, $list);
}
close IN;

&cleaner(\@acc);
my @cleantab = &cleaner(@acc);

###############
# Subroutines #
###############

sub cleaner {
	unless (ref $_[0]) {
		my @acc = @_;
		my @cleantab;
		my $previous = '';
		@acc = sort @acc; #sorts tab
		while (scalar @acc > 0) { #runs as long as there is items in the list
			my $next = shift(@acc);
			chomp $next;
			if ($previous ne $next) {
				push(@cleantab, "$next\n");
				$previous = $next;
			}
		} #Takes a list-item, puts it into a variable, if it doesn't match, it will be sent to a new array 
		return @cleantab;
	}	
	if (ref $_[0] eq 'ARRAY') {
		my ($ref2) = @_;
		@{$ref2} = sort @{$ref2}; #sorts @acc by $ref
		my $first = 0;
		my $sec = 1;
		while($sec < (scalar @{$ref2})) { #while $sec is less than the scalar value of @acc
			if(${$ref2}[$first] eq ${$ref2}[$sec]) { #if $first and $sec are the same
				splice(@{$ref2}, $sec, 1);	#it will be spliced off the array
			}
			else{ #otherwise it will move on
				$first++;
				$sec++;
			}
		}	
	}
}