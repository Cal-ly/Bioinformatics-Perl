#!/usr/bin/perl

#This program adds a user-input integer: 
#n+(n-1)+(n-2)+(n-3)+...+0

print "\nInteger input for summation: ";
$n = <STDIN>;

#The user input, with user-friendly text 

chomp $n;

#chomping off everything else, but the user-defined variable

if ($n > 0){
	$res1 = 0;	#Defined to be sure, so Perl doesn't have to guess
	while ($n > 0){
		$res2 = $n + $res1; 
		$res1 = $res2;
		$n--;
	}
	$res = $res1 + $n;	#calculation of the final result
	print "Result: ";	
	print "$res\n";		
}
elsif ($n < 0){
	$res1 = 0;	#Defined to be sure, so Perl doesn't have to guess
	while ($n < 0){
		$res2 = $n + $res1; 
		$res1 = $res2;
		$n++;
	}
	$res = $res1 + $n;	#calculation of the final result
	print "Result: ";	
	print "$res\n";		
}
else {
	print "Result: 0";
}



