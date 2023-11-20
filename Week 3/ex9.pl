#!/usr/bin/perl

#this program calculates the sum, the number of lines, the average value
#the number of positiv, negativ and zero lines, the maximum and minimum value of input

$sum eq 0;
$line eq 0;
$line_pos eq 0;
$line_neg eq 0;
$line_zero eq 0;
$gre = undef; #makes $gre undefined
$low = undef; #makes $low undefined
$var = <STDIN>;	#the input
chomp $var;
while (defined $var){	#as long as $var is defined, the loop runs
	chomp $var;
	$res = $sum + $var;	#adding $sum and the input and defines it as $res
	$sum = $res;	#defining $res as $sum
	if ($var > 0){	#if the input is positiv, then there wil be added 1 
		$line_pos++; #to the positiv count and one to the overall count
		$line++;
	}
	elsif ($var < 0){ #if the input is negativ, then there wil be added 1 
		$line_neg++; #to the negativ count and one to the overall count
		$line++;
	}
	elsif ($var == 0){ #if the input is zero, then there wil be added 1 
		unless ($var eq ''){ #to the zero count and one to the overall count
			$line_zero++; #Execpt if the input is an empty line
			$line++;
		} 
	}
	if (!defined($gre) and !defined($low)){ #if $low is undefined, then $low will be defined as $var
		$gre = $var;
		$low = $var;
	}
	elsif ($gre < $var){ #if $var is greater than $gre, then $var becomes $gre
		$gre = $var;
	}
	elsif ($low > $var){ #if $var is less than $low, then $var becomes $low
		$low = $var;
	}	
	$var = <STDIN>;	#new input
}

$ave = $sum/$line;
print "Lines total: $line\n";
print "Sum of values of lines: $sum\n";
print "Average value per line: $ave\n";
print "Lines positiv: $line_pos\n";
print "Lines negativ: $line_neg\n";
print "Lines zero: $line_zero\n";
print "Largest number: $gre \n";
print "Lowest number: $low \n";


