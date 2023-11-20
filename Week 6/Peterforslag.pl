#!/usr/bin/perl -w
use strict;

my $high = 1000;
my $middle = int($high/2 + 1);
# pick a random number between $low and $high, both inclusive
my $number = int(rand($high)+1);
my $count = 1;
while($middle >= 0 and $middle <= $high and $number != $middle){
	print "high: $high middle: $middle number:$number\n";
	if($number == $middle){
		print "Found $number\n";
	}
	elsif($number > $middle){
		$middle = int(($high + $middle)/2);
	}
	elsif($number < $middle){
		$middle = int(($high - ($high - $middle))/2);
	}
	die if ++$count > 30;
}
print "END middle: $middle\n";