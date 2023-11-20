#!/usr/bin/perl -w
use strict;


#calculates the standard deviation sqrt((sum(Xi-X)^2)/(n)) of an input file.

my $inputfile = &input_file(@ARGV); 
open (IN, '<', $inputfile) or die "Could not open file\n $!";
my @all_numbers;
my $total;
while (defined (my $line = <IN>)) {
	chomp $line;
	my @tmp =  split ("\t", $line);
	foreach my $elem (@tmp) { #runs through all elements in the inputfile
		$total += $elem; #adding them up
		push (@all_numbers, $elem); #feeding them to an new array
	}
}
close IN;


my $N = scalar @all_numbers;
#print "Total value: $total\nNumber of values: $N\n";
my $mean = abs($total/$N);
#print "Mean: $mean\n";
#all the smaller values, if someone wanted to error check their numbers

my $sum = 0;
foreach my $elem (@all_numbers) {
	$sum += (($elem - $mean)**2); #Calculation of sum
}

my $result = sqrt($sum/$N); #Printing the result
print "Standard deviation: $result\n";

###############
# Subroutines #
###############

sub input_file { #The input subroutine, takes either the @ARGV as input or from the STDIN
	my @ARGV = @_; #sends argument vector to our default array (@_)
	my $file;
	if ($#ARGV < 0) {
		print "Please enter a file name: ";
		$file = <STDIN>;
		chomp $file;
	}
	elsif ($#ARGV == 0) {
		$file = $ARGV[0];
	}
	else {
		die "Too many arguments\n";
	}
	return $file;
}
