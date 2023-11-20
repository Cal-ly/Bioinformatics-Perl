#!/usr/bin/perl -w
use strict;

my @array = '';
open (IN, '<', 'gene1') or die "Couldn't open file $!";
while(defined (my $line = <IN>)) {
	chomp $line;
	push (@array, $list);
}
close IN;

print $array[0];

#open (OUT, '>', 'gene') or die "$!";
#print OUT @array;



#close OUT;

=pod
	if ($line =~ m/^\d+\s+\d+/g) {
		
	}
=cut