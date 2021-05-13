#!/usr/bin/perl
use strict;

# Usage: gen_pages.pl ../data/colors/chapter1.json
# Usage: gen_pages.pl chapter1
use NOWUtil;

use Data::Dumper;
use JSON::Parse;
# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';


foreach my $chap (1..12) {
    my $fname = "chapter$chap.json";

    # page data in data/chapter1.json

    # color data in data/colors/chapter1.json

    my $color_file = NowUtil::PROJDIR;
    my $data = JSON::Parse::json_file_to_perl($color_file);

    foreach my $page_id (keys %$data) {
      my (undef, $chapter, $page) = split '-', $page_id;
      # panel color pages
      my $fname = sprintf("page-%02d-%02d", $chapter, $page);
      my $file = "../content/pages/$fname.md";
      my $obj = $data->{$page_id};
      $obj->{chapter_num} = $chapter;
      $obj->{title} = sprintf("Chapter %d, Page %d", $chapter, $page);
      $obj->{weight} = sprintf("%d%02d", $chapter, $page);
      $obj->{page_num} = $page;
      open my $fh, '>', $file or die $!;
      print $fh Dumper($obj);
      close $fh;
    }
}
