package Lemonolap::Formatelog ;
use strict;
use XML::Simple;
our $VERSION = '0.01';
sub new {
my $class =shift;
my %args = @_;
my $file = $args{config};
my $self;
my $config= XMLin ($file);
$self->{file} =$file;
$self->{config} =  $config;
bless $self,$class;
return $self;

}

sub get_file {
    my $self =shift;
    return $self->{config}->{format}->{file};

}
sub get_handler {
    my $self =shift;
    return $self->{config}->{format}->{handler};

}

sub get_separator {
    my $self =shift;
    return $self->{config}->{format}->{separator};

}
sub get_fields {
    my $self =shift;
    return $self->{config}->{format}->{fields};

}


1;





__END__

=head1 NAME

    Lemonolap::Formatelog - Perl extension for Lemonolap  framework
  

=head1 SYNOPSIS

 use  Lemonolap::Formatelog;
 my $format = Lemonolap::Formatelog->new (config => "/myxml.xml" );
 my $file = $format->get_file;
 my $handler= $format->get_handler;
 eval "use $handler;"; 
 my $log= $handler->new(file => $file);
 print  $log->get_field_by_name(header=>1 ),"\n";
 while (my $line =$log->get_field_by_name()) {
    print "$line\n";

 }

  and /myxml.xml is like this 

  <lemonolap>
	<format id="format1"
		file="/root/extract.log"
		handler="Lemonolap::Log4lemon"
	        />
  </lemonldap>	




=head1 DESCRIPTION

This module is a logs formater . It parses lemonldap logs into flat file with separator .
 It's a wrapper of log's formater  

=head1 Methods

=head2 new->(config => /path_file_xml) ;

 Path of XML  file . This file MUST exits . 
 
=head2 get_file () ;

 return the file read from xml config   

=head2 get_handler ();


 return  a string with module name  

=head2 get_separator();

 return the separator

=head2 get_fields();

 return a string with contents the list of fields 

=head1 SEE ALSO

Lemonldap
http://lemonldap.sourceforge.net/

Lemonolap
http://lemonolap.sourceforge.net/

Lemonolap::Loh4lemon 




=head1 COPYRIGHT AND LICENSE

 Copyright (C) 2004 by Eric German , E<lt>germanlinux@yahoo.frE<gt>

 Lemonldap originaly written by Eric german who decided to publish him in 2003
 under the terms of the GNU General Public License version 2.

 This package is under the GNU General Public License, Version 2.
 The primary copyright holder is Eric German.
 Portions are copyrighted under the same license as Perl itself.

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; version 2 dated June, 1991.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 A copy of the GNU General Public License is available in the source tree;
 if not, write to the Free Software Foundation, Inc.,
 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

=cut






