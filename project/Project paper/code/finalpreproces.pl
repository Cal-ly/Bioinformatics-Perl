#!/usr/bin/perl -w
use strict;

my @array = '';
open (IN, '<', 'gene2pubmed') or die "Couldn't open file $!";
while (defined (my $line = <IN>)) {
	my @tmp = split ("\t", $line);
	my $first = shift (@tmp);
	if ($first =~ m/^9606$/) {
		my $list = "$tmp[0]\t$tmp[1]";
		push (@array, $list) if $first =~ m/^9606$/;
	}
}
close IN;

open (OUT, '>', 'gene2pubmedHumanPro2') or die "$!";
print OUT @array;
close OUT;