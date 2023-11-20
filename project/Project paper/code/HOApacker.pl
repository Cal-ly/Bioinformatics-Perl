#!/usr/bin/perl -w
use strict;

my %HOA;
my $gene2 = 1;
my $array = [];
open (IN, '<', 'gene2pubmedHumanPro') or die "Couldn't open file $!";
while (defined (my $line = <IN>)) {
	chomp $line;
	my $flag = 0;
	my @tmp = split ("\t", $line);
	my $gene1 = $tmp[0];
	if ($gene1 eq $gene2) {
		push (@$array, $tmp[1]);
	}
	else {
		$array = [];
	}
	$HOA{$gene1} = $array; #FEJL FEJL FEJL first index is not there
	$gene2 = $tmp[0];
}
close IN;