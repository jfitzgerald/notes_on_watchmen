#!/usr/bin/perl

# Usage: perl gen_chapter.pl
# Assumes data files named chapter[1-12].json in: data/ and data/colors/
# Example:
#  data/chapter1.json
#  data/colors/chapter1.json
#
# Writes corresponding chapter and page files : content/chapters/ and content/pages/
# Example:
#  content/chapters/chapter-1.md
#  content/pages/page-01-01.md
#  content/pages/page-01-02.md
#  content/pages/page-01-03.md
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

foreach my $chap (1..12) {
    my $fname = "chapter$chap.json";

    # page data in data/chapter1.json
    my $chapter_file = NOWUtil::PROJDIR."data/$fname";
    print "chapter: $chap\n";
    if(-e $chapter_file) {
        my $book = JSON::Parse::json_file_to_perl($chapter_file);

        foreach my $ch (@{$book->{chapters}}) {
            my $ch_data = {};
            $ch_data->{pages} = [];
            while (my ($key, $val) = each (%$ch)) {
                if(!ref $val) {
                    $ch_data->{$key} = $val;
                }
            }
            $ch_data->{total_pages} = scalar @{$ch->{pages}};

            # Get color data (referenced later)
            my $color_file = NOWUtil::PROJDIR."data/colors/$fname";
            my $color_data = {};
            if(-e $color_file) {
                $color_data = JSON::Parse::json_file_to_perl($color_file);
            }
            else {
                print "no color data: $color_file\n";
            }

            # Character data
            my $characters = NOWUtil::gen_characters($ch->{pages});
            $ch_data->{characters} = $characters;

            # {
            #   "page": 1,
            #   "panels": [
            #     [ { "color":"yellow", "cols":3 } ],
            #     [ { "color":"gray" },{ "color":"yellow" },{ "color":"gray" } ],
            #     [ { "color":"yellow" },{ "color":"gray" },{ "color":"yellow" } ]
            #   ]
            # },
            # chapter cover page is a 2-column grid
            #my $cover = { page=>"0", col_layout=>2, panels=> [ [ {color=>"black"}, {color=>"gray"} ] ]};
            #push @{ $ch_data->{pages} }, $cover;
            my $total_panels=0;
            foreach my $pg (@{$ch->{pages}}) {
                my $page_id = sprintf("page-%02d-%02d", $ch->{chapter_num}, $pg->{page_num});

                my $new_pg = { id => $page_id, page_num => $pg->{page_num}, panels => [] };
                my $pn_max = $pg->{layout} || 9;
                $new_pg->{col_layout} = $pn_max/3;
                my $cols = int $pn_max / 3;
                my $prev_row;
                foreach my $pn (@{$pg->{panels}}) {
                    my $pn_num = $pn->{panel};
                    #print STDERR "Panel # $pn_num\n";

                    my $panel_id = sprintf("panel-%02d-%02d-%02d",
                      $ch->{chapter_num},
                      $pg->{page_num},
                      $pn_num);
                    my $new_pn = { id => $panel_id };
                    if($pn->{width}) {$new_pn->{cols} = $pn->{width};}
                    if($pn->{height}) {$new_pn->{rows} = $pn->{height};}
                    if($pn->{color}) {$new_pn->{color} = $pn->{color};}

                    if($new_pn->{cols} == $cols && $new_pn->{rows} > 1) {
                        $new_pg->{has_splash} = "1";
                    }

                    my $p_index = $pn_num - 1;
                    my $row = int $p_index / $cols;
                    #if(!defined $new_pg->{panels}[$row]) {
                    if($row != $prev_row) {
                        # start a new row
                        push @{ $new_pg->{panels} }, [];
                        $prev_row = $row;
                    }
                    push @{ $new_pg->{panels}[$row] }, $new_pn;
                    $total_panels++;
                }
                push @{ $ch_data->{pages} }, $new_pg;

                # Get color data and generate individual page
                #my $page_id = sprintf("wm-%d-%d", $ch->{chapter_num}, $pg->{page});
                if(defined $color_data->{$page_id}) {
                    my $page_data = {
                      id => $page_id,
                      col_layout => $new_pg->{col_layout},
                      panels => $new_pg->{panels},
                      color_data => $color_data->{$page_id}
                    };

                    # panel and color data pages
                    $page_data->{chapter_num} = $ch->{chapter_num};
                    $page_data->{page_num} = $pg->{page_num};

                    $page_data->{title} = sprintf("Chapter %d, Page %d",
                      $ch->{chapter_num}, $pg->{page_num});
                    $page_data->{weight} = sprintf("%d%02d",
                      $ch->{chapter_num}, $pg->{page_num});

                    my $pg_fname = sprintf("%s.md", $page_id);
                    my $out_file = NOWUtil::PROJDIR."content/pages/$pg_fname";
                    print "Creating $out_file\n";
                    open my $fh, '>', $out_file or die $!;
                    print $fh Dumper($page_data);
                    close $fh;
                }
            }
            $ch_data->{total_panels} = $total_panels;

            my $ch_fname = sprintf("chapter-%d.md", $ch->{chapter_num});
            my $out_file = NOWUtil::PROJDIR."content/chapters/$ch_fname";
            print "Creating $out_file\n";
            open my $fh, '>', $out_file or die $!;
            print $fh Dumper($ch_data);
            close $fh;
        }
    }
    else {
        print "no data file: $chapter_file\n";
    }
}
