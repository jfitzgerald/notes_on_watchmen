#!/usr/bin/perl
use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';


#my $hist_file = '/Users/justin/Pictures/watchmen/Chapter01/chapter1-hist.txt';
my $hist_file = $ARGV[0] or die "Missing input histogram file\n";
my $fh;
open $fh, "<$hist_file" or die "Could not open $hist_file\n";
#my $hist = JSON::Parse::json_file_to_perl($hist_file);


my $json_file = '/Users/justin/Code/notes_on_watchmen/data/colors.json';
#my $json_file = $ARGV[0] or die "Missing input JSON file\n";
my $colors = JSON::Parse::json_file_to_perl($json_file);
my %rev_colors = reverse %$colors;

my $next_clr = 0;
foreach my $k (keys %$colors) {
    my (undef, $num) = split '-', $k;
    if($num gt $next_clr) {
        $next_clr = $num;
    }
}
$next_clr++;

#    1854154: ( 51, 51, 51) #333333 grey20
while(my $line = <$fh>) {
    chomp $line;
    my $hex;
    $hex = $1 if($line =~ /(#[A-Z0-9]{6})/);
    if(!defined $rev_colors{$hex}) {
        my $next_key = "clr-".$next_clr++;
        $colors->{$next_key} = $hex;
        $rev_colors{$hex} = $next_key;
    }
}
# http://www.imagemagick.org/discourse-server/viewtopic.php?t=29666

# http://dcl.ils.indiana.edu/cbml/
#
#   convert "wm - 59.jpg" +dither -remap netscape: websafe.jpg
#   convert websafe.jpg -format %c -depth 8 -remap netscape: histogram:info:hist_websafe.txt
#   sort -n hist_websafe.txt |tail -20

    print Dumper($colors);

{
    # Create character data files
    #my $new_file = $base_path . $o->{slug} . ".md";
    #print STDERR "$new_file\n";
    #open my $fh, '>', $new_file or die $!;
    #print $fh Dumper($o);
}
