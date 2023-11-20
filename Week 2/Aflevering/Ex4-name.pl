#!/us/bin/perl

#This script asks for your name. If your name is Carsten then it will add a
#nicer greeeting and my middle and last name

print "What is your name: ";  #printes question on screen

$name = <STDIN>;	#Here the script needs input from user

chomp $name;		#Chomps the "return newline", som only $name is sent
			#through the "pipeline"
if ($name eq 'Carsten'){		#If the name is "Carsten" then:
	print "Have a jolly ";		#It will print "have a jolly"
	$name .= ' Haislund Johansen';	#it will add " Haislund Johansen" to 
}					#to "Carsten" in the output	

print "good day $name\n";		#printes name 

