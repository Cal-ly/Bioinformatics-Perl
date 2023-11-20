#!/usr/bin/perl -w
use strict;

my $number = 0;
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
	$number++;
}
close IN;

print $number, "\n";

my $nodes = scalar keys %HOA;
print $nodes, "\n";

my $lookup_gene = 1;
my $lookup_val = 0;
#my $ref = \%HOA;

#my $var = ${${$ref}{$lookup_gene}} [$lookup_val];
my $var = ${${HOA}{$lookup_gene}} [$lookup_val];

#foreach my $key (sort keys %HOA) {
#	foreach my $elem (@{$HOA{$key}}) {
#		print $key, "\t", $elem, "\n";
#	}
#}

#if (defined $var) {
#	print "$var\n";
#}
#else {
#	print "No\n";
#}

