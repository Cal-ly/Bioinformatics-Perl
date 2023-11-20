#!/usr/bin/perl

#This program factorizes a positiv user-input integer: 
#n! = n*(n-1)*(n-2)*(n-3)*...*1

print "\nInteger input for factorization: ";
$n = <STDIN>;	#The user input, with user-friendly text 

chomp $n; #chomping off everything else, but the user-defined variable

if ($n > 0){	#If condition: as long as $n is greater than 0 the script runs
	$res1 = 1;	#A necessity, otherwise we would multiply with zero
	while ($n > 1){	#Loop condition: $n shall be greater than zero	 
		$res2 = $n * $res1; #this ensures the result from every loop
		$res1 = $res2;	#is saved for the next loop for multiplication
		$n--;	#substracting 1 from $n after every loop
	}
	$res = $res2 * $n;	#calculation of the final result
	print "Result: ";	
	print "$res\n";		#printing text and result
} elsif ($n eq 0){			#If input eq 0, the the result will be 1
	print "Result: 1\n";
}
else{			#If the input in negativ, error message wil display
	print "Error, negativ integer";
}
