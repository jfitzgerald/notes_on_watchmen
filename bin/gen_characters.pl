#!/usr/bin/perl

# Usage: perl gen_characters.pl
# Assumes generated content files named chapter-[1-12].json in: content/chapters/
# Example:
#  content/chapters/chapter-1.md
#
# Writes corresponding character files : content/characters/
# Example:
#  content/characters/nite-owl.md
#  content/characters/dr-manhattan.md
#  ...

use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';

use NOWUtil;

my $heroes = NOWUtil::get_characters();

# character data to process:
#  - Stats
#   - First Panel
#   - Last Panel
#   - Primary Chapter
#   - Appears with Most
# - # panels (%)
# - # of panels appears solo
# - # of panels appears with characters
my %ch_map = ();
foreach my $h (@{$heroes->{main_characters}}) {
  $h->{weight} = $h->{chart_order};
  $h->{title} = $h->{hero_name};

  $h->{first_panel} = ""; # panel-01-01-03
  #$h->{last_panel} = "";  # panel-12-24-03
  $h->{primary_chapter} = "";
  $h->{primary_chapter_total} = 0;
  $h->{appears_with_most} = "";
  $h->{total_panels} = 0;
  $h->{total_panels_solo} = 0;
  $h->{chapter_totals} = [];
  $h->{appears_with} = [];
  $h->{tmp_appears_with} = {}; # use this to tally and gen the array, then delete

  # appears_with: [
  # {
  #   "total" : 20,
  #   "name" : "Nite Owl",
  #   "name_key" : "dan_dreiberg"
  # },
  # {
  $ch_map{$h->{hero_name_key}} = $h;
  $ch_map{$h->{real_name_key}} = $h;
}

foreach my $chap (1..12) {
  my $fname = "chapter-$chap.md";
  # chater data from content/chapter-1.md
  my $chapter_file = NOWUtil::PROJDIR."content/chapters/$fname";
  print "chapter: $chap\n";
  if(-e $chapter_file) {
    my $chapter = JSON::Parse::json_file_to_perl($chapter_file);

    # {
    #   "hero_name" : "Rorschach",
    #   "appears_with" : {
    #     "dr_manhattan" : 13,
    #     "adrian_veidt" : 8,
    #     "dan_dreiberg" : 20,
    #     "laurie_juspeczyk" : 12
    #   },
    #   "total" : 119,
    #   "real_name_key" : "walter_kovacs",
    #   "primary_color" : "clr-172",
    #   "real_name" : "Walter Kovacs",
    #   "hero_name_key" : "rorschach"
    # },
    foreach my $hero (@{$chapter->{characters}}) {
      # TODO:
      my $rec = $ch_map{$hero->{hero_name_key}};
      $rec->{total_panels} += $hero->{total};
      push @{$rec->{chapter_totals}}, $hero->{total};
      if($hero->{total} > $rec->{primary_chapter_total}) {
        $rec->{primary_chapter_total} = $hero->{total};
        $rec->{primary_chapter} = $chapter->{chapter_num};
      }
      if(!$rec->{first_panel} && $hero->{first_panel}) {
        my $num = sprintf("%02d", $chapter->{chapter_num});
        my $tmp = $hero->{first_panel};
        # convert "panel-xx-01-01" to "panel-01-01-01"
        $tmp =~ s/xx/$num/;
        $rec->{first_panel} = $tmp;
      }

      # "appears_with" : [
      #   {
      #     "name_key" : "dan_dreiberg",
      #     "total" : 20,
      #     "name" : "Nite Owl"
      #   },
      #my @tmp = @{$hero->{appears_with}};
      map {
        $rec->{tmp_appears_with}{$_->{name_key}} += $_->{total};
      } @{$hero->{appears_with}};
    }
  }
  else {
    print "no data file: $chapter_file\n";
  }
}

# convert tmp_appears_with hash to array of objects
foreach my $ch (@{$heroes->{main_characters}}) {
  while (my ($key, $value) = each (%{$ch->{tmp_appears_with}})) {
    push @{$ch->{appears_with}},
      {
        name_key => $key,
        total => $value,
        name => $ch_map{$key}{hero_name}
      };
  }
  delete $ch->{tmp_appears_with};
}

foreach my $h (@{$heroes->{main_characters}}) {
  my $fname = sprintf("%s.md", $h->{hero_name_key});
  my $out_file = NOWUtil::PROJDIR."content/characters/$fname";
  print "Creating $out_file\n";
  open my $fh, '>', $out_file or die $!;
  print $fh Dumper($h);
  close $fh;
}
