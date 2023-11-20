my $low = 1;
my $high = 10;
print "Think of a number between $low and $high (both inclusive)\n",
      "Press <Enter> when you are ready\n";
my $answer = <STDIN>;
my $count = 0;
while ($answer ne 'Y' and $high > $low) {
   my $guess = int(($high + $low)/2);
   print "Is it $guess ?? Answer yes, higher or lower\n"; 
   $count++;
   # what says the user, ensure well defined answers
   $answer = 'Guess';
   while ($answer ne 'Y' and $answer ne 'H' and $answer ne 'L') {
      print "Stop writing nonsense to me.\n" if $answer ne 'Guess';
      $answer = <STDIN>;
      $answer = uc(substr($answer, 0, 1)); # Translating $answer into uppercase.
   }
   # narrow down interval
   if ($answer eq 'H') {
      $low = $guess + 1;
   } elsif ($answer eq 'L') {
      $high = $guess - 1;
   }
}
if ($high < $low) {
   print "You are a lier.\n";
}
else {
   if ($high == $low) {
      $count++;  # This is arguable, after all this is not a guess.
      print "You are thinking of $low or you have lied to me.\n";
   } else {
      print "That was lucky.\n";
   }
   print "I used $count guesses.\n";
}
