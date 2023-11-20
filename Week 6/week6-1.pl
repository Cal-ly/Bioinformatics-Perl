#!/usr/bin/perl -w
use strict;

my @primes = (2, 3, 5, 7, 11, 13);
my @names = (Per, Bla, Anne, Carsten);

$primes[2] = 6; #changes the index on position 2

print $primes[2], "\n"; #printes specific position 

print "@primes\n";	#printes arrays with newline

for (my $i = 0; $i <= $#primes; $i++){ #printes to last position
	print "$primes[$i]\n";
}

for (my $i = 0; $i < scalar @primes; $i++){	# scalar printes to "one more" than last position
	print "$primes[$i]\n";
}

for (my $i = scalar @primes -1; $i >= 0; $i--){	# printes from last to first
	print "$primes[$i]\n";
}

foreach my $element (@primes){ #alliasing @primes to $element, printing 
	print $element, "\n";
}

foreach my $element (@primes){
	$element *=2 #changes the array (mulitplying by two), even thou not accessing it
	print $element, "\n";
}

#to extend list from end
$primes[6] = 17; #appending 17 to position 6

push(@primes, 17); #pushes 17 to end of the list

#to shorten the list from end
my $value = pop(@primes); #pops the last position of the list

#to shorten the list from start
$value = shift(@primes);

#to extend the list from start
unshift(@primes, 1); #adds 1 to start of the list

splice(@primes, 2, 0, 4); #adds 4 to our primes at position 2, taking out 0 elements
#replacing it with 4, thus adding 4

splice(@primes, 2) #takes elements from position two and onwards

my @temp = splice(@primes, 2, 3, (4,6,8)); #adds 4, 6 and 8 to array

#reverse primes
@primes = reverse @primes;

#empty the array
@primes = ();

undef @primes;

#sort
@primes = sort @primes; #sorts alfanumerical or alphabetically on first position.
						#Capitol letters are first according to ASCII (man ascii)

@names = sort {$a <=> $b} @names # <=> same as cmp

@names = sort {lc $a <=> lc $b} @names #sorts it case-insensitiv

@primes = sort {$a cmp $b} @primes #sorts them to numerical order

@primes = sort {0.5 < rand} @primes #sorts them to with a 50% chance that it comes in random order

#join - joins together an array to a strings

print join("\n", @primes), "\n"; 

$var = join("\t", @names); #prints 'Name0   Name1   Name2'

#split 

my $st = 'Leon Julia Linda Per';

my @names = split(' ', $st); #splits on the ' ' widespace, could be "\t" splits on tab then

print join("\n", @names), "\n"; #Printes the names as a list

split(" ", $st, 3) #splits it into 3 maximum

#ARGV

foreach my $elem (@ARGV) {
	print "$elem\n";
}



