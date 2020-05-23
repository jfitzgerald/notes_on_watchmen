#!/usr/bin/perl
use strict;

# Usage: gen_page_swatches.pl ../data/colors/chapter1.json
use NOWUtil;

use Data::Dumper;
use JSON::Parse;
# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';


my $json_file = $ARGV[0] or die "no color data file specified";
my $data = JSON::Parse::json_file_to_perl($json_file);

foreach my $page_id (keys %$data) {
  my (undef, $chapter, $page) = split '-', $page_id;
  # panel color pages
  my $fname = sprintf("page-%02d-%02d", $chapter, $page);
  my $file = "../content/pages/$fname.md";
  my $obj = $data->{$page_id};
  $obj->{ChapterNum} = $chapter;
  $obj->{Title} = sprintf("Chapter %d, Page %d", $chapter, $page);
  $obj->{weight} = sprintf("%d%02d", $chapter, $page);
  $obj->{PageNum} = $page;
  open my $fh, '>', $file or die $!;
  print $fh Dumper($obj);
  close $fh;
}
