#!/usr/bin/perl -w
use strict;

#Make a program that calculates the product of two matrices and prints it on STDOUT (the screen). 
#The matrices are in the files mat1.dat and mat2.dat. Numbers in the files are tab separated. 
#A matrix should be stored as an array of arrays.

#Advice: The program should have a subroutine that reads a matrix from a given file (to be used twice), 
#a subroutine that calculates the product, and a sub that prints a matrix. This way ensures that your 
#program is easy to change to other forms of matrix calculations. 

my @pro_mat;
my @mat1 = &open_matrix;
my @mat2 = &open_matrix;

my $ref1 = \@mat1;
my $ref2 = \@mat2;

&transpose($ref2);

if (scalar @{$ref1} ne scalar @{$ref2}) {
	die "The matrix' can't be multiplied\n" 
}


#&print_matrix($ref1);
&print_matrix($ref2);

###############
# Subroutines #
###############

sub open_matrix {
	print "What matrix file do you want to open: ";
	my $filename = <STDIN>;
	chomp $filename;
	my @matrix;
	my @tmp;
	open(IN, '<', $filename) or die "$!";
	while (defined (my $line = <IN>)) {
		chomp $line;
		@tmp =  split ("\t", $line);
		push (@matrix, [@tmp]);
	}
	close IN;
	return @matrix;
}

sub print_matrix {
	my $ref = shift;
	foreach my $ref (@{$ref}) {
		print join ("\t", @{$ref}, "\n");
	}
}



______

