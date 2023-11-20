=head1 NAME

FastaParse - Reading fasta files

=head1 SYNOPSIS


  use FastaParse;

  # Reads the fasta file
  my $fas = new FastaParse('FastaFileName'); 
  while ($fas->MoreEntries) {
     $fas->ReadNextEntry;
     print $fas->Name, "\n";
     print $fas->Comment, "\n";
     print $fas->Seq, "\n";
     print $fas->Length, "\n"; }
  $fas->Close;
  undef $fas;

=head1 DESCRIPTION

This module is a simple fasta file reader created for demonstration purposes.

=head1 METHODS

=over 4

=item new $fasta_file_name

Instantiate a new FastaParse object. There can be as many as wanted. $fasta_file_name is the name (and path if necessary) to the fasta file. Instantiating the object immediately readies the fasta file for reading. Whenever an error occurs - it might be reading permissions or parsing errors - you are warn'ed and the object will be undefined. If you undef the object, data are discarded and the file closed.

 Example: $fas = new FastaParse("/foo/bar.fasta");
 Example: $fas = new FastaParse("/foo/bar.fasta") or die;


=item MoreEntries

Returns true if there are one or more unread fasta entries in the file.

 Example:   while ($fas->MoreEntries) {


=item ReadNextEntry

Reads the next entry in the fasta file. Read returns true if successful, false otherwise (no more entries).

Example: $fas->ReadNextEntry;
Example: while($fas->ReadNextEntry) {

 
=item Close

Closes the fasta file for further reading.

 Example: $fas->Close;


=item Name

Returns the name/identifier of the fasta entry.

 Example: print $fas->Name, "\n";


=item Comment

Returns the comment of the fasta entry. The comment is the string after the identifier on the header line.

 Example: print $fas->Comment, "\n";


=item Seq

Returns the sequence of the fasta entry.

 Example: print $fas->Seq, "\n";


=item Length

Returns the length of the sequence.

 Example: print $fas->Length, "\n";


=head1 BUGS/LIMITATIONS

An entry has to be able to be in memory.

=head1 COPYRIGHT

Copyright (c) 2005 Peter Wad Sackett

All right reserved. This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.


=head1 AUTHOR

Peter Wad Sackett <pws@cbs.dtu.dk>

=cut

package FastaParse;
use strict;

$FastaParse::VERSION = '0.1';

# This subroutine is automatically called (if it exists) when the last
# reference to the object disappears or the program ends.
sub DESTROY {
   my $self = shift @_;
   $self->Close if exists $self->{'_File'};
}


# This subroutine is automatically called (if it exists) when the
# module is loaded by the main program. Anything here is executed
# BEFORE any statements in the main program.
sub BEGIN {
}


# Private internal subroutine to handle errors gracefully.
sub error {
   my ($self, $msg) = @_;
   chomp $msg;
   warn "$msg\n";
   exit;
}


# Instantiating (creating) a new FastaParse object.
sub new {
   my ($self, $filename) = @_;
   my $hash = {};
   if (!$filename) {
      $self->error("No file name given"); }
   my $filehandle;
   open($filehandle, $filename) or
      $self->error("Can't open file: $filename\nReason: $!");
   while (defined (my $line = <$filehandle>)) {
      next unless $line =~ m/^>\S+/;
      $hash->{'_Header'} = $line;
      last; }
   $hash->{'_File'} = $filehandle;
   return bless($hash, ref($self) || $self);
}


sub Close {
   my $self = shift @_;
   close $self->{'_File'};
   delete $self->{'_File'};
   $self->{'_Header'} = '';
   $self->{'Name'} = '';
   $self->{'Comment'} = '';
   $self->{'Seq'} = '';
}


sub MoreEntries {
   my $self = shift @_;
   return '' ne $self->{'_Header'};
}


sub Name {
   my $self = shift @_;
   return $self->{'Name'} if $self->{'Name'};
   return undef;
}


sub Comment {
   my $self = shift @_;
   return $self->{'Comment'} if exists $self->{'Comment'};
   return undef;
}


sub Seq {
   my $self = shift @_;
   return $self->{'Seq'} if $self->{'Seq'};
   return undef;
}


sub Length {
   my $self = shift @_;
   return length($self->{'Seq'}) if $self->{'Seq'};
   return undef;
}


sub ReadNextEntry {
   my $self = shift @_;
   return 0 unless $self->{'_Header'};
   my ($id, $com) = split(' ', $self->{'_Header'}, 2);
   $self->{'Name'} = substr($id, 1);
   if (defined $com) {
      $com =~ s/\s+$//;
      $self->{'Comment'} = $com; }
   elsif (exists $self->{'Comment'}) {
      delete $self->{'Comment'}; }
   my $filehandle = $self->{'_File'};
   $self->{'_Header'} = '';
   my $seq = '';
   while (defined (my $line = <$filehandle>)) {
       chomp $line;
       if ($line =~ m/^>\S+/) {
          $self->{'_Header'} = $line;
	  last; }
       elsif ($line =~ m/[^\w ]/) {
          $self->error("Error in fasta format in the following line:\n$line"); }
       else {
	  $line =~ s/\s//g; 
	  $seq .= $line; } }
   $self->{'Seq'} = $seq;
   return 1;
}



# You ALWAYS have to end a module with 1 as the module
# is evaluated when used in a program. Evauation to 0 means
# that the module is not loaded correctly.
1;