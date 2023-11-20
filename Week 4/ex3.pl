#!/usr/bin/perl

#Make a new program thats ask for two filenames, one at a time. It should then display (output/print) on one line the first line from the first file concatenated (with tab) with the first line from the second file, and so forth. The output should be like that of the UNIX command paste. Try with the files ex1.acc and ex1.dat and compare with the same UNIX paste command, exercise 1.14. It should be the same.

$file1 = <STDIN>;
$file2 = <STDIN>;
chomp $file1;
chomp $file2;

open (FILE1, '<', $file1) or die "Couldn't open file $file1 \n";
open (FILE2, '<', $file2) or die "Couldn't open file $file2 \n";
while (defined ($line1 = <FILE1>) and defined ($line2 = <FILE2>)){	
	chomp $line1;
	chomp $line2;		
	if ($line1 eq defined and $line2 eq defined){
		print "$line1 \t $line2 \n";
	}
	elsif (defined ($line2)){
		print "$line1 \t";
	}
	elsif (defined ($line1)){
		print "\t $line2";
	}
}

	

close FILE1;
close FILE2;
