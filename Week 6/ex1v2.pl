#!/usr/bin/perl -w
use strict;

#THis program asks for words and saves them in a file called words.txt until you write STOP.

my $word;
print "Enter words you want to add to the list, enter STOP to end\n";
my $input = <STDIN>;
chomp $input;
while ($input ne 'STOP'){
	$word .= "$input\n"; #input is apeended to $word
	print "Enter new words, enter STOP to end\n";
	$input = <STDIN>;
	chomp $input;
}

#creates words.txt and printes $word to it
open(OUT, '>', 'words.txt') or die "Could not create file\n";
print OUT $word;
close OUT; 