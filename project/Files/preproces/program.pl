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

my $nodes = scalar keys %HOA;
print $nodes, "\n";

my $mention = 0;
my $weight = 0;
my $ref = \%HoA

open (OUT, '>', 'weight.txt') or die "$!";
foreach my $lookup_gene (keys %HOA) {
	foreach my $lookup_val (values @{$HOA{$lookup_gene}}) {
		foreach my $search_gene (keys %HOA) {
			foreach my $search_val (@{$HOA{$search_gene}}) {
				if ($@{$HOA{$lookup_gene}}[$lookup_val] eq $search_val) {
					$mention++;
				} 
			}
			$weight = $mention/$nodes unless $mention eq '0';
			if ($weight gt '0') {
				print OUT "$lookup_gene\t$weight\t$search_gene\n";
			}
			$mention  = 0;
		}
	}
}
#${${$ref}{$acc_id}} [$i];
close OUT;

__END__
my $key1 = 3;
if (exists $HOA{$key1}) {
	foreach my $elem (@{$HOA{$key1}}) {
		print $elem, "\n";
	}
}