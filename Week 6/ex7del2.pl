#!/usr/bin/perl -w
use strict;

my $filename1;
my $filename2;

if ($ARGV[0] ne ''){ #if the first filename is specified in CMDLINE, then it is set to $filename1
	$filename1 = $ARGV[0];
	chomp $filename1;
} 
else{ #if no argument is specified, the program will ask for it
	print "No argument recived, enter first file: ";
	$filename1 = <STDIN>;
	chomp $filename1;
}

if ($ARGV[1] ne ''){ #if the sec filename is specified in CMDLINE, then it is set to $filename2
	$filename2 = $ARGV[1];
	chomp $filename2;
} 
else{ #if no argument is specified, the program will ask for it
	print "No argument recived, enter second file: ";
	$filename2 = <STDIN>;
	chomp $filename2;
}
#The rest of the program, has already been explained in an exercise 4.3 
open(FIRST, '<', $filename1) or die "$filename1 does not exist\n";
open(SECOND, '<', $filename2) or die "$filename2 does not exist\n";
my $line1 = <FIRST>;
my $line2 = <SECOND>;
while (defined $line1 and defined $line2) {
   chomp $line1;
   print "$line1\t$line2\n";
   $line1 = <FIRST>;
   $line2 = <SECOND>;
}
while (defined $line1) {
   chomp $line1;
   print "$line1\t\n";
   $line1 = <FIRST>;
}
while (defined $line2) {
   print "\t$line2\n";
   $line2 = <SECOND>;
}
close FIRST;
close SECOND;