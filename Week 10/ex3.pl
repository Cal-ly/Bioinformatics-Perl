#!/usr/bin/perl -w
use strict;

#This program transposes and printes a matrix from a file


my %matrix;
my $row = 0;
my $col = 0;

open(IN, '<', 'matrix.dat') or die "$!\n"; 
while (defined (my $list = <IN>)){
	chomp $list;
	my @split = split ("\t", $list);
	foreach my $element (@split) {
		$matrix{$row, $col} = $element;
		$col ++;
	}
	$col = 0;
	$row ++;
} #Opens ands pushes the matrix into a hash, with coordinates
close IN;

my $href = \%matrix; #the reference

&transpose($href);
&matrix_print($href);

###############
# Subroutines #
###############

sub transpose {
	my ($href) = @_;
	my $row = 0;
	my $col = 0;
	my $trans1;
	my $trans2;
	my %submat = ();
	for (%{$href}) {
		$trans1 = ${$href}{$row, $col};
  		$trans2 = ${$href}{$col, $row};
		if (exists ${$href}{$row, $col}) {
			$submat{$row, $col} = $trans2;
			$submat{$col, $row} = $trans1;
			$col ++;
		} #Makes the submatrix which is the transposed to the original matrix
		unless (exists ${$href}{$row, $col}) {
			$row ++;
			$col = 0;
		}
	}
	$row = 0;
	$col = 0;
	for (values %submat) {
  		my $trans = $submat{$row, $col};
		if (exists $submat{$row, $col}) {
			${$href}{$row, $col} = $trans;
			$col ++;
		}
		unless (exists $submat{$row, $col}) {
			$row ++;
			$col = 0;
		}
	} #Transposes the original matrix, according to the submatrix	
}

sub matrix_print {
	my ($href) = @_;
	my $row = 0;
	my $col = 0;
	for (values %{$href}) {
		if (exists ${$href}{$row, $col}) {
			print ${$href}{$row, $col}, "\t";
			$col ++;
		}
		unless (exists ${$href}{$row, $col}) {
			print "\n";
			$row ++;
			$col = 0;
		}
	} #Printes the matrix
}
