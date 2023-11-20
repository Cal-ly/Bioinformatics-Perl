#!/usr/bin/perl -w
use strict;

my %HOA;
my $gene1 = 1;
my $gene2 = 1;
my $array = [];
open (IN, '<', 'pro-test') or die "Couldn't open file $!";
while (defined (my $line = <IN>)) {
	chomp $line;
	my $flag = 0;
	my @tmp = split ("\t", $line);
	$HOA{$gene1} = $array if scalar (defined($array)); 
	$gene1 = $tmp[0];
	if ($gene1 eq $gene2) {
		push (@$array, $tmp[1]);
	}
	else {
		$array = [];
	}
	#$HOA{$gene1} = $array; #FEJL FEJL FEJL first index is not there
	$gene2 = $tmp[0];
}

close IN;


my $key1 = 1;
my $key2 = 2;

if (exists $HOA{$key1}) {
	foreach my $elem (@{$HOA{$key1}}) {
		print $elem, "\n";
	}
}
if (exists $HOA{$key2}) {
	foreach my $elem (@{$HOA{$key2}}) {
		print $elem, "\n";
	}
}

