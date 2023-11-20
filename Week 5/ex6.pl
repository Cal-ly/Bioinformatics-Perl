#!/usr/bin/perl -w
use strict;

#this program read and printes the ID, accession number, amino sequence. It also verifies that the number of
#amino sequences is the same as in the headline. The program will make a new file called 'sprot.fsa where
#it printes the ID, accession number and number amino acids in the headline and the amino sequence
#with 60 characters per line. 

print "Enter a file in SwissProt format: ";
my $file = <STDIN>;
chomp $file;
my $flag = 0;
my $seq;
my $aa_num;
my $id;
my $ac;	#defining my variables and my user-input 
open (IN, '<', "$file") or die "$!\n";	#opens user defined file or dies
while (defined (my $line = <IN>)) {	#loop running through each line 
	chomp $line;	
	if (substr($line, 0, 2) eq 'ID') {#recognizes the ID mark in a SwissProt file
		my $i = 2;	#starts at the end of the SwissProt marker
		while (substr($line, $i, 1) eq ' ') {
			$i++;	#as long as the loop gets 'space' it chugs on, adding to $i
		}
		while (substr($line, $i, 1) ne ' ') {
			$id .= substr($line, $i, 1);
			$i++;	#loop recives other than 'space' it appends it to $id and add
		}			#one to the $i
	}
	if (substr($line, 0, 2) eq 'AC') {#recognizes the AC mark in a SwissProt file
		my $i = 2; 	#starts at the end of the SwissProt marker	
		while (substr($line, $i, 1) eq ' ') {
			$i++;	#as long as the loop gets 'space' it chugs on, adding to $i
		}
		while (substr($line, $i, 1) ne ';') {
			$ac .= substr($line, $i, 1);
			$i++;	#loop recives other than ';' it will continue appending to $ac
		}	
	}
	if(substr($line, 0, 2) eq 'SQ') {#recognizes the SQ mark in a SwissProt file
		my $i = 2;	#starts at the end of the SwissProt marker
		my $header; #defining a variable 
		while (substr($line, $i, 3) ne 'AA;') { #as long as loop don't recive 'AA;' it runs
			if (substr($line, $i, 1) eq ' ') { #if it recives 'space', then it just moves on 
				$i++;
			}
			elsif (substr($line, $i, 1) ne ' ') { #if there is anything else but space, then 
				$header .= substr($line, $i, 1);  #it will add to '$header'
				$i++;
			}
		}
		my $length_head = length($header); 
		$length_head -= 8;	#this part cuts off 'SEQUENCE' from '$header'
		$aa_num = substr($header, 8, $length_head);	#the amino acid number is now $aa_num
	}
	$flag = 0 if substr($line, 0, 2) eq '//';	
	$seq .= $line if $flag == 1;	
	$flag = 1 if substr($line, 0, 2) eq 'SQ';	#Parsing statement sussing out the amino
}												#sequence adding it to $seq
my $seq1;
my $length_seq = length($seq);
my $i = 0;
while ($i < $length_seq) {	#this whole loop chops out the 'spaces' from the amino sequence
	if (substr($seq, $i, 1) eq ' '){ #skipping the spaces
		$i++;
	}
	elsif (substr($seq, $i, 1) ne ' ') { #adds everything else but space to $seq1
		$seq1 .= substr($seq, $i, 1);
		$i++;
	}
}
my $length_seq1 = length($seq1); 
if ($length_seq1 ne $aa_num) { #if the amino number in the SwissProt info isn't the same as the 
	print "Length of amino sequence: $length_seq1 "; #length of the amino sequence it will
	print "doesn't match given headline: $aa_num \n"; #an error message
}

close IN;
print "SwissProt ID: $id \n";
print "Accession number: $ac \n";
print "Amino sequence:\n$seq1\n"; #printes ID, accession number and amino sequence to screen

open (OUT, '>', "sprot.fsa") or die "Could not create file\n"; #creates a new file 'sprot.fsa'
print OUT ">$ac $id $aa_num AA\n";	#printes >, accession number, SwissProt ID, number of 
$i = 0;							#amino acids to headline of the FASTA file.
while ($i < length($seq1)){ #this loop printes the amino sequence to 'sprot.fsa' with 60 chars per line
   print OUT substr($seq1, $i, 60), "\n";
   $i += 60;
}
close OUT;
														





