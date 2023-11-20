#!/usr/bin/perl -w
use strict;

#This program reads all the words in words.txt in an array and sorts them alphabetically
#afterwards it willbe reversed and written back into the file

my $list;
my @word = ();
#opens words.txt and send it to an array @word
open(IN, '<', 'words.txt') or die "$!\n";
while (defined ($list = <IN>)){
	push(@word, $list);
}
close IN;

@word = sort @word; #sorts the array @word

@word = reverse @word; #reverses @word

print @word; #prints @word to screen

#opens words.txt and saves @word to it, thus overwriting the file 
open(OUT, '>', 'words.txt') or die "$!\n";
print OUT @word;
close OUT;