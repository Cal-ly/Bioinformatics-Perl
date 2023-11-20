#!/usr/bin/perl -w
use strict

#Now make a program that extracts data from dna-array.dat. It shall ask for an accession number (unless you have given it on the command line). 
#Make sure your program handles both situations. Then it shall search in the file for the data concerning that accession number. 
#If it does not find it (you gave a wrong accession no), complain and stop. Otherwise it shall display the data in two tab separated columns. 
#First column shall be the data from the cancer patients, second column for the controls. And yes, there are not the same number of sick and healthy people - be able to handle that.

$inputacc = &inputacc(@ARGV); 

if $inputacc m/^\b\w+\t(\w+)\b/


###############
# Subroutines #
###############

sub inputacc {
	my @ARGV = @_;
	my $acc;
	if ($#ARGV < 0) {
		print "Which accession number do you want extract data from: ";
		$acc = <STDIN>;
		chomp $acc;
	}
	elsif ($#ARGV == 0) {
		$acc = $ARGV[0];
	}
	else {
		die "Too many arguments\n";
	}
	return $acc;
}