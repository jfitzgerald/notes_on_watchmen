#!/usr/bin/perl

# Usage: perl character_stats.pl data/chapter1.json
use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';

use lib '../';
use NOWUtil;

#my $json_file = '../data/chapter1.json';
my $json_file = $ARGV[0] or die "Missing input JSON file\n";
my $book = JSON::Parse::json_file_to_perl($json_file);

foreach my $ch (@{$book->{chapters}}) {
    my $characters = NOWUtil::gen_characters($ch->{pages});
    print Dumper($characters);
}


