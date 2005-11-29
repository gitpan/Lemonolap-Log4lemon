use  Lemonolap::Formatelog;
my $format = Lemonolap::Formatelog->new (config => "myxml.xml" );
my $file = $format->get_file;
my $handler= $format->get_handler;
eval "use $handler;"; 
my $log= $handler->new(file => $file);
print  $log->get_field_by_name(header=>1 ),"\n";
while (my $line =$log->get_field_by_name()) {
    print "$line\n";

}
print "eric "
