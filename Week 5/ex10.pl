#!/usr/bin/perl -w
use strict;

#Not finished program

print "Chose lowest integer: ";
my $input1 = <STDIN>;
chomp $input1;

print "Chose highest integer: ";
my $input2 = <STDIN>;
chomp $input2;

print "Think of a number between $input1 and $input2\n";
my $guess1 = $input2;
my $count = 0;

for($input1, $input1 <= $input2, $input1++){
	$count++;
	my $guess2 = int(($guess1+1)/2);
	print "Is it the number: $guess2? (y/n)"
	my $answer = <STDIN>;
	if ($answer eq 'y'){
		print "Wee, I have guessed the number in $count attempts!";
	}
	elsif($answer eq 'n'){
		print "Is it higher or lower? (h/l)";
		$high_low = <STDIN>;
		if ($high_low eq 'l'){
			$guess1 = $guess2;
		}
		elsif($high_low eq 'h'){
			$guess1 = $guess2;	
		}
	}

}

