#!/usr/bin/perl -w
use strict;


my @product;
my @mat1 = &open_matrix("mat1.dat");
my @mat2 = &open_matrix("mat2.dat");

my $ref1 = \@mat1;
my $ref2 = \@mat2; 
my $prod = \@product;

die "The matrix' can't be multiplied\n" if scalar @{$ref1} ne scalar @{${$ref2}[0]};


my $col = 0;
for (my $row = 0; $row <= $#{$ref1}; $row++) {
	for (my $j = 0; $j <= $#{$ref1}; $j++) { #Shall stop after one column
		my $c = 0;	
		for (my $i = 0; $i <= $#{$ref1}; $i++) {
			$c += ${$ref1}[$j][$i] * ${$ref2}[$i][$j];
		}
		${$prod}[$row][$col] = $c;
		$col++;
	}
	$col = 0;	
}


for (my $row = 0; $row <= $#{$ref1}; $row++) {
	
	for (my $j = 0; $j <= $#{$ref1}; $j++) {

	}

	for (my $i = 0; $i <= $#{$ref1}; $i++) {

	}	

}

&print_matrix($prod);


###############
# Subroutines #
###############
sub open_matrix {
	my ($filename) = @_;
	my @mat;
	open(IN, '<', $filename) or die "$!";
	while (defined (my $line = <IN>)) {
		chomp $line;
		my @tmp =  split ("\t", $line);
		push (@mat, [@tmp]);
	}
	close IN;
	return @mat;
}

sub print_matrix {
	my $ref = shift;
	foreach my $ref (@{$ref}) {
		print join ("\t", @{$ref}, "\n");
	}
}