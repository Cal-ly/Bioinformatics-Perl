#!/usr/bin/perl -w
use strict;

#After having looked at the list in clean.acc, you discover that the accession numbers 
#are sorted. This means that you can use the much more powerful binary search method. 
#Repeat the previous exercise, but this time use binary search.

my $list;
my @acc = ();
open(IN, '<', 'clean.acc') or die "$!";
while (defined ($list = <IN>)){
	chomp $list;
	push(@acc, $list);
}
close IN;

#@acc = sort @acc;

#print @acc, "\n";

#print scalar @acc, "\n";

#my $low = 0; 
#my $high = scalar @acc;
my $ac_input = 0;
while ($ac_input ne 'STOP'){
	print "Enter accession number or STOP to stop: ";
	$ac_input = <STDIN>;
	chomp $ac_input;
	my $low = 0; 
	my $high = scalar @acc;
	my $flag = 0;
	my $pos_guess = 0;
	my $ac_guess = 1;
	while ($low < $high and $ac_input ne $ac_guess and $ac_input ne 'STOP'){
		$pos_guess = int(($high + $low)/2);
		$ac_guess = $acc[$pos_guess];
		#print "$pos_guess\n";
		if($ac_input gt $ac_guess){
			$low = $pos_guess + 1;
		}
		elsif($ac_input lt $ac_guess){
			$high = $pos_guess - 1;
		}
		#elsif($ac_input eq $ac_guess){
		#	$flag = 1;
		#}
	}
	if($ac_input eq 'STOP'){
	print "Search stopped\n";
	}
	elsif($low > $high){
		print "Could not find $ac_input\n";
	}
	elsif($ac_input eq $ac_guess){
		my $position = $pos_guess + 1; 
		print "$ac_input found at position $position\n";
	}
	elsif($low == $high){
		print "low eq high\n";
	}
}
=pod
if($ac_input eq 'STOP'){
	print "Search stopped\n";
}
elsif($low > $high){
	print "Could not find $ac_input\n";
}
elsif($ac_input eq $ac_guess){
	print "$ac_input found at position $pos_guess\n";
}
elsif($low == $high){
	print "low eq high";
}
=cut

#while($mid_value > 0 and $mid_value < $tot_value){ 

#while($ac ne 'STOP'){

#my $mid_value = int(($tot_value/2) + 1);

=pod
my $first = 3130; #U06643
my $sec = 1895; #M20919



if($acc[$first] lt $acc[$sec]){
		print "first less than second\n";
	}
else{
	print "first greater than second\n";
}


while($mid_value >= 0 and $mid_value <= $tot_value and $ac ne $acc[$mid_value]){ 
	if($ac eq $acc[$mid_value]){
		print "Found $ac\n";
	}
	elsif($ac gt $acc[$mid_value]){
		$mid_value = int(($tot_value + $mid_value)/2);
	}
	elsif($ac lt $acc[$mid_value]){
		$mid_value = int(($tot_value - ($tot_value - $mid_value))/2);
	}
}
=cut