#!/usr/bin/perl
use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';

use NOWUtil;

#my $hist_file = '/Users/justin/Pictures/watchmen/Chapter01/chapter1-hist.txt';
my $hist_file = $ARGV[0] or die "Missing input histogram file\n";
my $fh;
open $fh, "<$hist_file" or die "Could not open $hist_file\n";
#my $hist = JSON::Parse::json_file_to_perl($hist_file);


my $json_file = NOWUtil::PROJDIR.'data/colors.json';
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
close $fh;

# Get crops
# http://www.imagemagick.org/discourse-server/viewtopic.php?t=29666
# http://dcl.ils.indiana.edu/cbml/

# Get Histograms
#   convert "wm - 59.jpg" +dither -remap netscape: websafe.jpg
#   convert websafe.jpg -format %c -depth 8 -remap netscape: histogram:info:hist_websafe.txt
#   sort -n hist_websafe.txt |tail -20

# unique colors:
# perl -e 'my $c=(); while(my $l=<>){my $clr; $clr = $1 if($l=~/(#[A-Z0-9]{6})/);print $clr ."\n" if(!$c{$clr}); $c{$clr}=1;}' < chapter1-hist.txt >out

    #print Dumper($colors);

{
    # Update color files
    open my $fh, '>', $json_file or die $!;
    print $fh Dumper($colors);
    close $fh;
}
