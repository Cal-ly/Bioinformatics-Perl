#!/usr/bin/perl -w
use strict;

open (IN, '<', 'gene_info') or die "Couldn't open file $!";
open (OUT, '>', 'gene_info2') or die "$!";
while (defined (my $line = <IN>)) {
	print OUT $line if $line =~ m/^9606\s+\d+/g;
}
#Everytime a line matches, it will be printed to the file 'gene2'
close IN;
close OUT;