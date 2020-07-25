package NOWUtil;

use strict;

use JSON::Parse;
use Data::Dumper;

# Dumper setting to output JSON
$Data::Dumper::Indent = 1;
$Data::Dumper::Terse = 1;
$Data::Dumper::Useqq = 1;
$Data::Dumper::Pair = ' : ';

use constant PROJDIR => '/Users/justin/Code/notes_on_watchmen/';

#  IN: $characters ARRAY REF
# OUT: $characters ARRAY REF (deduped, cross-referenced hero/real names)
sub dedup_characters {
  my ($chrs) = shift;

  my $people = JSON::Parse::json_file_to_perl(PROJDIR.'data/characters.json');
  my $name_map = {};
  foreach my $ch (@{$people->{main_characters}}) {
    $name_map->{$ch->{hero_name_key}} = $ch;
    $name_map->{$ch->{real_name_key}} = $ch;
  }

  my %map = ();
  foreach my $nm (@$chrs) {
    my $xname = $name_map->{$nm}{hero_name_key};
    $map{$xname} = 1;
  }
  my @dedup = keys %map;
  return \@dedup;
}

sub get_characters {
  return JSON::Parse::json_file_to_perl(PROJDIR.'data/characters.json');
}

#  IN: $pages ARRAY REF
# OUT: $character_data
sub gen_characters {
  my ($pages) = shift;

  # Create Name Map
  # Name Map =
  # {
  #    "dr_manhattan" => $drman_ref,
  #    "jon_osterman" => $drman_ref,
  #    "nite_owl"     => $owl_ref,
  #    "dan_dreiberg" => $owl_ref,
  #  }
  my $people = get_characters();
  #JSON::Parse::json_file_to_perl(PROJDIR.'data/characters.json');
  my $name_map = {};
  foreach my $ch (@{$people->{main_characters}}) {
    # set reverse key lookups by real and hero name
    $ch->{tmp_appears_with} = {};
    $ch->{appears_with} = [];
    $ch->{total} = 0;
    $ch->{panel_appearance_data} = [];
    $ch->{first_panel} = ""; # panel-01-01-03
    #$ch->{last_panel} = "";  # panel-12-24-03

    $name_map->{$ch->{hero_name_key}} = $ch;
    $name_map->{$ch->{real_name_key}} = $ch;
  }

  # Reading page/panel data
  # Example panel:
  # {
  #   "panel": 2
  #   ,"chronology": "present"
  #   ,"characters": ["dan_dreiberg" ,"laurie_juspeczyk"]
  # },
  my $panel_index = 0;
  foreach my $pg (@$pages) {
    foreach my $pn (@{$pg->{panels}}) {
      # initiliaze appearance data to 0
      map {
        $_->{panel_appearance_data}[$panel_index] = 0
      } @{$people->{main_characters}};

      if($pn->{characters}) {
        my @tmp = @{$pn->{characters}};
        foreach my $nm (@{$pn->{characters}}) {
          my $chr = $name_map->{$nm};
          $chr->{total}++;
          $chr->{panel_appearance_data}[$panel_index] = 1;

          # we're not in a chapter context so we can only
          # save the page and panel numbers. we'll let the
          # gen_characters.pl script figure this out.
          if(! $chr->{first_panel}) {
            $chr->{first_panel} = sprintf("panel-xx-%02d-%02d", $pg->{page_num}, $pn->{panel});
          }

          # tally the character-character associations
          map { if($nm ne $_){ $chr->{tmp_appears_with}{$_}++; } } @tmp;
        }
      }
      $panel_index++;
    }
  }

  # convert appears_with hash to array of objects
  foreach my $ch (@{$people->{main_characters}}) {
    while (my ($key, $value) = each (%{$ch->{tmp_appears_with}})) {
      push @{$ch->{appears_with}}, {name_key => $key, total => $value, name => $name_map->{$key}{hero_name}};
    }
    delete $ch->{tmp_appears_with};
  }


  my @chars = ();
  map { push @chars, $_ if($_->{hero_name} && $_->{total}) } @{$people->{main_characters}};

  return \@chars;
}

#  IN: { "#FF0000" : 123567 }
# OUT: { labels => [], raw_values  => [], percent_values => [] }
sub gen_panel_colors {
  my ($cnt) = shift;
  my $data = {
    labels => [],
    raw_values => [],
    percent_values => []
  };
  my $total=0;
  map { $total += $_ } values %$cnt;

  foreach my $clr (sort {$cnt->{$b} <=> $cnt->{$a}} keys %$cnt) {
    #print STDERR $cnt{$clr}."/$total\n";
    my $percent = int($cnt->{$clr}/$total * 100);
    next unless $percent > 0;
    push @{$data->{raw_values}}, $cnt->{$clr};
    push @{$data->{percent_values}}, $percent;
    push @{$data->{labels}}, $clr;
  }

  return $data;
}

1;
