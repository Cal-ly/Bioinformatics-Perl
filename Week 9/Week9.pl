#!/usr/bin/perl -w
use strict;



print 2+4, "\n";

print &add(2,4), "\n";

sub add {
	my ($no1, $no2) = @_;
	my $result = $no1 + $no2;
	return $result;
}

_____

my @primes = (2,3,5,7,11);

print &sum(2,$no,@primes,4,6), "\n"; 

sub sum {
	my (@no) = @_;
	my $result = 0;
	foreach my $n (@no) {
		$result += $n;
	}
	return $result;
}

############################
#Another way to to the same#
############################

my @primes = (2,3,5,7,11);

print &sum(2,$no,@primes,4,6), "\n"; 

sub sum {
	my $result = 0;
	foreach my $n (@_) {
		$result += $n;
	}
	return $result;
}

############################
#Another way to to the same#
############################

my @primes = (2,3,5,7,11);

print &sum(2,$no,@primes,4,6), "\n"; 

sub sum {
	my $result = 0;
	for (my $i 0; $i <= $#_; $i++) {
		$result += $_[$i];
	}
	return $result;
}

_____

#!/usr/bin/perl -w
use strict;

my $n1 = 1; 
my $n2 = 2; 
my $n3 = 3; 

print "weird1: ", &weird1($n1, $n2, $n3), "\n";
print "$n1, $n2, $n3\n";

print "weird2: ", &weird2($n1, $n2, $n3), "\n";
print "$n1, $n2, $n3\n";

sub weird1 {
	my ($n1,$n2,$n3) = @_; #Call-by-value
	$n1 += 1;
	$n2 += 2;
	$n3 += 3;
	return $n1*$n2*$n3;
}

#Does not change the array - printes "Weird1: 48	1, 2, 3"

sub weird2 { #Call-by-reference
	$_[0] += 1;
	$_[1] += 2;
	$_[2] += 3;
	return $_[0]*$_[1]*$_[2];
}

#Changes the array - printes "Wired2: 48	2, 4, 6"

_____

#this does not work with either hashes or array.. DOES NOT WORK!
my @primes = (2,3,5,7,11);
my @even = (2,4,6,8,10);
#@res = (2*2, 4*3, 6*5....

my @result = &multimulti(@primes,@even);

print "@result\n";

sub multimulti {
	my (@a1, @a2) = @_;
	my @res;
	for (my $i = 0; $i <= $#@a1; $i++) {
		push (@res, $a1[$i]*$a2[$i]);
	}
	return @res;
}

#THE ARRAY OR HASH HAS TO BE THE LAST PARAMETER

my @result = &multimulti(4,@even);

print "@result\n";

sub multimulti2 {
	my ($mul, @a2) = @_;
	my @res;
	for (my $i = 0; $i <= $#@a1; $i++) {
		push (@res, $mul*$a2[$i]);
	}
	return @res;
}

_____

