package WMUtil;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw(parse_histogram);

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';


#  IN: file path to histogram file
# OUT: { #HEX => count }
sub parse_histogram {
    my $file = shift;
    my $fh;
    open $fh, "<$hist_file" or die "Could not open $hist_file\n";

    #    1854154: ( 51, 51, 51) #333333 grey20
    my %cnt=();
    my $total=0;
    while(my $line = <$fh>) {
        chomp $line;
        my ($num, $rem) = split ':', $line;
        my $hex;
        $hex = $1 if($rem =~ /(#[A-Z0-9]{6})/);
        $cnt{$hex} += $num;
        #$total+=$num;
    }
    close $fh;
    return \%cnt;
}

1;
