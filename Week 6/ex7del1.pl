#!/usr/bin/perl -w
use strict;


my $filename;

if ($ARGV[0] ne ''){ #Filename from CMDLINE and saves it as $filename 
	$filename = $ARGV[0];
	chomp $filename;
} 
else{ #if no argument vector is received, then the program will ask for a file
	print "What file do you want to see: ";
	$filename = <STDIN>;
	chomp $filename;
}
open(IN, '<', $filename) or die "$filename does not exist\n";
my $line = <IN>;
while (defined $line) {
   print $line;
   $line = <IN>;
}
close IN;
