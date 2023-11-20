#!/usr/bin/perl -w
use strict;


#Arrays of Arrays

my $aref = [1, 2, 3]; # an anonymous array 

my @AoA = ([1, 2, 3], [5, 6], [7]); #Creates an array of references to anonymous arrays

${$AoA[0]}[2] = 10; #Replaces the first arrays position number 2 with 10

#OR

$AoA[0][2] = 10; #Replaces the first arrays position number 2 with 10

for (my $i = 0; $i <= $#AoA; $i ++) {
	for (my $j = 0; $j <= $#{$AoA[$i]}; $j ++) {
		print "$i, $j => $AoA[$i][$j]\n";
	}
}

foreach my $aref (@AoA) {
	print join (' ', @{$aref}, "\n")
}
______

my @matrix;
#my @tmp;
open(IN, '<', 'mat1.dat') or die "$!";
while (defined (my $line = <IN>)) {
	chomp $line;
	my @tmp =  split ("\t", $line);
	push (@matrix, \@tmp);
}
close;

foreach my $aref (@matrix) {
	print join ("\t", @{$aref}, "\n")
}

#Or you could

my @matrix;
my @tmp;
open(IN, '<', 'mat1.dat') or die "$!";
while (defined (my $line = <IN>)) {
	chomp $line;
	@tmp =  split ("\t", $line);
	push (@matrix, [@tmp]);
}
close;

foreach my $aref (@matrix) {
	print join ("\t", @{$aref}, "\n")
}

______

my @matrix;
my @tmp;
open(IN, '<', 'mat1.dat') or die "$!";
while (defined (my $line = <IN>)) {
	chomp $line;
	@tmp =  split ("\t", $line);
	push (@matrix, [@tmp]);
}
close;

for (my $i = 0; $i <= $#matrix; $i++) {
	$matrix[$i][4] = 1;
}

foreach my $aref (@matrix) {
	push (@{$aref}, 1);
}

foreach my $aref (@matrix) {
	print join ("\t", @{$aref}, "\n")
}

______

#Hash of Hashes

my %HoH = ( Peter => {height => 172, weight => 76},
			Josef => {height => 179, weight => 55},
			Carsten => {height => 193, weight => 96});


$HoH{Carsten}{age} = 22; #adding to a hash of hash

$HoH{Peter}{kids} = ['Marcus', 'Freya']; #should be dereferenced properly

$HoH{Linda}{height} = 171;

$HoH{Vanessa}{hair} = 'Brown';

$HoH{Peter}{hair} = 'Dark blonde';

foreach my $name (keys %HoH) {
	print "$name:\n";
	foreach my $property (keys %{$HoH{$name}) {
		print "   $property => $HoH{$name}{$property}\n";
	}
}

print $HoH{Peter}{hair}, "\n" if exists $HoH{Peter}{hair};

print "No Henrike\n" unless exists $HoH{Henrike};

print $HoH{Henrike}{hair}, "\n" if exists $HoH{Henrike}{hair};

print "No Henrike\n" unless exists $HoH{Henrike};

#Be careful for autovivification

#the proper way to ask

print $HoH{Henrike}{hair}, "\n" if exists $HoH{Henrike} and exists $HoH{Henrike}{hair};

______

#from mat1.dat

print "@{${$ref1}[0]}\n"; # gives 4 7 3 8

print "${$ref1}[0][0]\n"; # gives 4

print "$ref1->[0][0]\n"; # gives 4

______

sub transpose { 
    my $ref2 = @_;
    for my $row (@{$ref2}) { 
        for my $column (0 .. $#{$row}) { 
            push(@{$ref2}[$column], $row-> [$column]); 
        } 
    } 
} 