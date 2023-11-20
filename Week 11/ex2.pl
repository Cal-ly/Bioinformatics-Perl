#!/usr/bin/perl -w
use strict;


#This program takes data from files 'test1.dat', 'test2.dat' and 'test3.dat', sends it into
#one hash of arrays and then calculates the average for each accession number

my %HoA;
my $ref = \%HoA;
&open_file("test1.dat");
&open_file("test2.dat");
&open_file("test3.dat");

my %result;
foreach my $acc_id (sort keys %{$ref}) {
	my $all = 0;
	my $i = 0;
	for ($i = 0; $i <= $#{${$ref}{$acc_id}}; $i++) {
		$all += ${${$ref}{$acc_id}} [$i];
	}
	my $average = $all/$i;
	$result{$acc_id} = $average;
}


foreach my $acc_id (sort keys %result) {
	print "$acc_id: $result{$acc_id}\n";
}


###############
# Subroutines #
###############

sub open_file {
	my ($filename) = @_;
	open(IN, '<', $filename) or die "$!";
	while (defined (my $line = <IN>)) {
		chomp $line;
		my @acc_num = split ("\t", $line);
		my $acc_id = shift(@acc_num);
		if (exists ${$ref}{$acc_id}) {
			push(@{${$ref}{$acc_id}}, @acc_num);
		} else {
			${$ref}{$acc_id}=\@acc_num;
		}
	}
	close IN;
}
