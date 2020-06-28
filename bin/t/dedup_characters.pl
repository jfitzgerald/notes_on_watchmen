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
my $chrs = ['walter_kovacs', 'rorschach', 'walter_kovacs', 'rorschach',
  'edward_blake', 'the_comedian', 'edward_blake', 'the_comedian',
  'dan_dreiberg', 'nite_owl', 'dan_dreiberg', 'nite_owl',
  'jon_osterman', 'dr_manhattan', 'jon_osterman', 'dr_manhattan',
  'adrian_veidt', 'ozymandias', 'adrian_veidt', 'ozymandias'
];

my $rv = NOWUtil::dedup_characters($chrs);
print Dumper($rv);
