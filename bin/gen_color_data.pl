#!/usr/bin/perl
use strict;

# Usage: gen_color_data.pl images/histogram/*.txt > data/colors/chapter1.json
use NOWUtil;

use Data::Dumper;
# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';


#my $hist_file = '/Users/justin/Pictures/watchmen/Chapter01/chapter1-hist.txt';
my $data = {};
foreach my $hist_file (@ARGV) {
  my $fh;
  open $fh, "<$hist_file" or die "Could not open $hist_file\n";
  my @parts = split /\//, $hist_file;
  my ($page_id, $ext) = split /\./, $parts[-1];
  my (undef, $chapter_num, $page_num) = split '-', $page_id;

  print STDERR "page_id: $page_id\n";

  #    1854154: ( 51, 51, 51) #333333 grey20
  my $cnt = {};
  while(my $line = <$fh>) {
      chomp $line;
      my ($num, $rem) = split ':', $line;
      my $hex;
      $hex = $1 if($rem =~ /(#[A-Z0-9]{6})/);
      next if($hex eq "#FFFFFF" || $hex eq "#000000");
      $cnt->{$hex} += $num;
  }
  close $fh;

  my $rv = NOWUtil::gen_panel_colors($cnt);
  $rv->{page_num} = $page_num;
  $data->{$page_id} = $rv;
}

print Dumper($data);
