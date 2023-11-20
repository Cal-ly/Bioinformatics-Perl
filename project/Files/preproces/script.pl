#!/usr/bin/perl -w
use strict;

my %HOA;
#my $gene1 = 1;
my $gene2 = 1;
my $array = [];
open (IN, '<', 'pro-test') or die "Couldn't open file $!";
while (defined (my $line = <IN>)) {
	chomp $line;
	my $flag = 0;
	my @tmp = split ("\t", $line);
	my $gene1 = $tmp[0];
	if ($gene1 eq $gene2) {
		push (@$array, $tmp[1]);
	}
#	elsif ($gene1 gt $gene2) {
#		$HOA{$gene1} = $array;
#		$flag = 1;
#	}
	else {
		$array = [];
		#$flag = 1;
	}
	$HOA{$gene1} = $array; #FEJL FEJL FEJL first index is not there
	$gene2 = $tmp[0];
	#$array = [] if $flag == 1;
}
close IN;


my $key1 = 3;
#my $key2 = 1;
#my $key3 = 1;

if (exists $HOA{$key1}) {
	foreach my $elem (@{$HOA{$key1}}) {
		print $elem, "\n";
	}
}
=pod
if (exists $HOA{$key2}) {
	foreach my $elem (@{$HOA{$key2}}) {
		print $elem, "\n";
	}
}
if (exists $HOA{$key3}) {
	foreach my $elem (@{$HOA{$key3}}) {
		print $elem, "\n";
	}
}
=cut


=pod
print "Hash content\n";
foreach $k (keys %hash) {
	foreach (@{$hash{$k}}) {
		print " : $_";
	}
	print "\n";
}
=cut 