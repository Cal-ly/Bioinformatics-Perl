#!/usr/bin/perl -w
use strict;

#This program uses subroutines to calculates the factorial. Has input control.

my $number = &input_number(@ARGV); #User input subroutine 

if ($number >= 0) {
	if ($number =~ m/^\d+$/) { #Ensures it is a integer
		my $result = &factor($number); #runs the subroutine &factor
		print "The factorial of $number is $result\n";
	}
	else {
		print "$number is not valid input\n";
	}
}
else {
	print "$number is not valid input\n";
}

###############
# Subroutines #
###############

sub input_number { #The input subroutine, takes either the @ARGV as input or from the STDIN
	my @ARGV = @_; #sends argument vector to our default array (@_)
	my $number;
	if ($#ARGV < 0) {
		print "Please enter a positive integer: ";
		$number = <STDIN>;
		chomp $number;
	}
	elsif ($#ARGV == 0) {
		$number = $ARGV[0];
	}
	else {
		die "Too many arguments\n";
	}
	return $number;
}



sub factor {
	my ($num) = @_; 
	my $factorial = 1;
	for (my $i = $num; $i > 1; $i--) {
		$factorial *= $i;
	}
	return $factorial;
} 

