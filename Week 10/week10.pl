#!/usr/bin/perl -w
use strict;

my %mat;

$mat{'blabla'} = 'somevalue';

my $x = 2;
my $y = 5;

$mat{"$x,$y,$z"} = 354;

#$mat{$x,$y,$z} = 354;

foreach my $key (keys %mat) {
	my {$x, $y, $z} = split(m/,/, $key);
}

sub retrieve {
	my {$x,$y,$z} = @_;
	if (exists $mat{"$x,$y,$z"}) {
		return $mat{"$x,$y,$z"};
	}
	else {
		return 0;
	}
}

my $val = exists $mat{"$x,$y,$z"} ? $mat{"$x,$y,$z"} : 0;
			#if this exists			#returns this 	or this value
my $val = &retrieve(34, 56, 12);

_____

sub add {
	my (@list) = @_;
	my $sum  = 0;
	foreach my $no (@list) {
		$sum += $no;
	}
	return $sum;
}

sub add { #call by reference
	$_[0] *= 2;
	$_[1] *= 3;
	return $_[0] + $_[1];
	# 2*x + 3*y 
}

_____

my $name = 'Peter';

my $nameref = \$name;

print "$name\n$nameref\n";

print ${$nameref}, "\n"; #dereferencing

_____

@primes = (2,3,5,7,11);

my $pref = \@primes;

print &add($pref), "\n";

sub  add {
	my {$aref} = @_;
	my $sum = 0;
	foreach my $no (@{$aref}) {
		$sum += $no;
	}
	return $sum
}

#another way to do the same
# @tab an array
# $#tab an arrays last element same as 'scalar @tab -1'

sub  add {
	my {$aref} = @_;
	my $sum = 0;
	#for (my $i = 0; $i < @{$aref}, $i++) { another way to do it
	for (my $i = 0; $i <= $#{$aref}, $i++) {
		$sum += ${$aref}[$i];
	}
	return $sum
}

_____

sub intersect { #what keys are commen between two hashes
	my ($href1, $href2) = @_;
	my @result;
	foreach my $key (keys %{$href1}) {
		push (@result, $key) if exists ${$href2}{$key};
	}
	return @result;
}

my %hash1 = ();
my %hash2 = ();

print &intersect(\%hash1, \%hash2);

_____

sub intersection { #assuming only input is either arrays or hashes
	my ($ref1, $ref2) = @_;
	my ($aref, $href);
	my (@ar, %hash);
	if (ref $ref1 eq 'HASH' and ref $ref2 eq 'HASH') {
		$href = $ref2;
		@ar = keys %{$ref1};
		$aref = \@ar;
	}
	elsif (ref $ref1 eq 'ARRAY' and ref $ref2 eq 'ARRAY') {
		$aref = $ref1;
		foreach my $val (@{$ref2}) {
			$hash{$val} = 1:
		}
		$href = \%hash;
	}
	elsif (ref $ref1 eq 'HASH') {
		$href = $ref1;
		$aref = $ref2;
	}
	else {
		$aref = $ref1;
		$href = $ref2;
	}
	my @result;
	foreach my $key (keys %{$aref}) {
		push (@result, $key) if exists ${$href}{$key};
	}
	return @result;
}


