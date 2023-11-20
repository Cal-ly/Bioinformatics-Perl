#!/usr/bin/perl

#This program open and reads the file ex1.acc, and then prints it to
#the screen 

$file = "ex1.acc";
open (IN, '<', $file)
while (defined ($line = <IN>)){
	chomp $line;	
	print $line, "\n";
}
close(IN);
