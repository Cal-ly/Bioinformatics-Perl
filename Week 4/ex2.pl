#!/usr/bin/perl

#This program ask for a filename, opens it and reads it, then printes
#it to the screen. If the file doesn't exists, the script terminates
#and prints an error message

$file = <STDIN>;
chomp $file;
open (FILE, '<', $file) or die "Couldn't open file $file \n";
while (defined ($line = <FILE>)){
	chomp $line;	
	print $line, "\n";
}
close(FILE);
