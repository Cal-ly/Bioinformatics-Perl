#!/usr/bin/perl -w
use strict;



my @list = ();
print "Enter words you want to add to the list, enter STOP to end\n";
my $input = <STDIN>;
chomp $input;
while ($input ne 'STOP'){
	push (@list, "$input\n");
	print "Enter new words, enter STOP to end\n";
	$input = <STDIN>;
	chomp $input;
}

open(OUT, '>', 'words.txt') or die "Could not create file\n";
print OUT @list;
close OUT; 
