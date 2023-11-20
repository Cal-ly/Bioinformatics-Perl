#!/usr/bin/perl

$file1 = <STDIN>;
$file2 = <STDIN>;
chomp $file1;
chomp $file2;

open (FILE1, '<', $file1) or die "Couldn't open file $file1 \n";
open (FILE2, '<', $file2) or die "Couldn't open file $file2 \n";
$line1 = <FILE1>;
$line2 = <FILE2>;
while (defined $line1){
	while (defined ($line1) and defined ($line2)){	
		chomp $line1;
		chomp $line2;	
		print "$line1 \t $line2 \n";	
	}


if (defined ($line1) and defined ($line2)){
	while (defined ($line1) and defined ($line2)){	
		chomp $line1;
		chomp $line2;	
		print "$line1 \t $line2 \n";	
	}
}
elsif (defined ($line1) and defined != ($line2)){
	while (defined ($line1) and defined != ($line2)){
		chomp $line1;
		chomp $line2;			
		print "$line1 \t";
	}
}
elsif (defined ($line2) and defined != ($line1)){
	while (defined ($line2) and defined != ($line1)){
		chomp $line1;
		chomp $line2;		
		print "\t $line2";
	}
}

close FILE1;
close FILE2;
