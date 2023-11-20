#!/usr/bin/perl -w
use strict;

#Let us improve on exercise 2.6. Use regular expressions (RE) to check that the data you get 
#when asking for numbers, are actually numbers. Also check that the operation is valid.
#These should all be considered as numbers: "4"   "-7"   "0.656"   "-67.35555" 
#These are not numbers: "5."  "56F"  ".32"  "-.04"

#This program works as a simple calculator, an improvment on former excercise 2.6

my $first;
my $second;
my $operation;
my $result;
my $argv = scalar @ARGV;
if ($argv != 3) {
	print "Not enough arguments in ARGV\n" if $argv < 1;
	print "Too many arguments in ARGV\n" if $argv > 3;
	print "First number: ";
	$first = <STDIN>;
	chomp $first;
	print "Please enter second number: ";
	$second = <STDIN>;
	chomp $second;
	print "Please enter the operation you wish to perform (+,-,*,/): ";
	$operation = <STDIN>;
	chomp $operation;
}
#defining user input
while ($first =~ m/\b\D/ or $first =~ m/\D\b/) {
	print "$first is not valid number, enter new: ";
	$first = <STDIN>;
	chomp $first;
}
while ($second =~ m/\b\D/ or $second =~ m/\D\b/) {
	print "$second is not valid number, enter new: ";
	$second = <STDIN>;
	chomp $second;
}
while ($operation !~ m/[-+*\/]/) {
	print "$operation is not a vaild operation (+,-,*,/), please enter new operation: \n";
	$operation = <STDIN>;
	chomp $operation;
}
#if numbers or operation symbol doesn't match our definition of a number or operator it will
#ask for another number or operattor until an accepted answer is given  
if ($operation eq '+') {
   $result = $first + $second;
} elsif ($operation eq '-') {
   $result = $first - $second;
} elsif ($operation eq '*') {
   $result = $first * $second;
} elsif ($operation eq '/') {
   if ($second == 0) {
      $result = 'Error, division by zero'; 
   } else {
      $result = $first / $second;
   }
}
print "$first $operation $second = $result\n";

#calculates and printes result