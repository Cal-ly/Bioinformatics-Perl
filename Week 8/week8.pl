#!/usr/bin/perl -w
use strict;

my %height = (Peter => 172, Josef => 179, Carsten => 193);

$height{"Linda Hove"} = 170; #adds Linda Hove to the hash

$height{Julia} = 168;

$height{Vanessa} = 165;

#print "$height{Peter}\n";

my %bla = reverse %height; 	#Turns values into keys and vice versa
							#Also removes all not-unique kyes

foreach my $name (sort keys %height) {
	print "$name is $height{$name} \n"; 
}

______

my %translationtable = (AC23456 => "TYR45_HUMAN", GH23451 => 'GHT_RAT');

$acc = 'hjgkk';

print $translationtable{$acc} #finds the corresponding SwissProt

______


my %AA = ('ATG' => 'H') #translation from codon to amino acid

______

if (exists $translationtable{$acc}) {
	#work
}
else {
	print "not there";
}

______

undef $hash;

%hash = ();

delete $height{Linda}; #only deletes that entry;

______

my $acc
while (defined (my $line = <IN>)) {
	chomp $line
	$acc{$line} = 1;
}

______

my @arr = keys %hash; #returnes the keys
my @arr = values %hash; #returnes the values

______

while (my ($key, $val) = each %height) {
	print "$key => $val\n";
}