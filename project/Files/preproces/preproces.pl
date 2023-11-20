#!/usr/bin/perl -w
use strict;

my @array = '';
open (IN, '<', 'gene2pubmed') or die "Couldn't open file $!";
open (OUT, '>', 'gene2pubmedHuman') or die "$!";
while (defined (my $line = <IN>)) {
	print OUT $line if $line =~ m/^9606\s+\d+/g;
}
#Everytime a line matches, it will be printed to the file 'gene2'
close IN;
close OUT;