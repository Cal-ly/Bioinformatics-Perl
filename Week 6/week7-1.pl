#!/usr/bin/perl -w
use strict;

open(IN, '<', 'sprot.dat') or die "$!";
my $id;
my $acc;
while (defined (my $line = <IN>)) {
	$id = $1 if $line =~ m/^ID\s+(\w+)/;
	$acc = $1 if $line =~ m/^AC\s+(\w+)/;
}

print "ID: $id, ACC: $acc\n";

______

$st = 'ABC 123 Peter'

if ($st =~ m/Peter/) {
	print "TRUE\n";
}
else {
	print "FALSE\n";
}

#if there is a match it will print TRUE like if you search 'Pet' or 'Peter' 
#but not 'pet' nor 'Peters'

$st = 'ABC 123 Peter'

if ($st =~ m/\d\d\d/) {
	print "TRUE\n";
}
else {
	print "FALSE\n";
}

# \d matches digits, \d\d\d matches 3 digits.
# \w will match words ('a-z', 'A-Z', '0-9' and '_') \W will match non-words
# \s matches white space ' ', "\t", "\n".. \S matches all but non-spaces
# . matches everything but newline. \n matches newline

# \b means word boundary, so it is needed to have a boundary

______

$st = 'ABC 123 Peter'

if ($st =~ m/\d+/) {
	print "TRUE\n";
}
else {
	print "FALSE\n";
}

# true, because you need one or more digits (+ eq "one or more")
______

#finding an accession number
$st = 'AB123456'

if ($st =~ m/\b[A-Z]{1,2}\d{6,8}\b/) {
	print "TRUE\n";
}
else {
	print "FALSE\n";
}

#you can negate an entire class with ^ like [^A-Z] everything from A-Z is not in it

______








