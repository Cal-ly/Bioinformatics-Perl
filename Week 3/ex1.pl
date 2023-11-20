!#/usr/bin/perl -w

#this program calculates the average between two user-defined integers

print "Calculates the average between two user-defined integers\n";
print "First integer input: \n";
$i1 = <STDIN>;
print "Second integer input: \n";
$i2 = <STDIN>;

#The user-input and some user-friendly text

chomp $i1;
chomp $i2;

#Chomping off the newline

$res = (int($i1 + $i2))/2;	#adds the two integers and divides them by two, ensures it is integers
print "Average: $res";	#printes the result on the screen



