# Use this file to define your ad layouts, placements, and arrangements.
# You can also use Ruby's methods to load up an ad, like File.read,
# just make sure you return the Hash for the ads at the end of this file.

{ :ad_layout_a =>
  { :placement_x =>
      { :left   => [ 'Left Ad 1 for Placement X', 'Left Ad 2 for Placement X' ],
        :center => 'Center Ad for Placement X',
        :right  => [ 'Right Ad 1 for Placement X', 'Right Ad 2 for Placement X']
      },
    :placement_y =>
      { :arrangement_q =>
          { :first  => 'First Ad for Arrangement Q',
            :second => 'Second Ad for Arrangement Q',
            :third  => 'Third Ad for Arrangement Q'
          },
        :arrangement_r =>
          { :left  => 'Left Ad for Arrangement R',
            :right => 'Right Ad for Arrangement R'
          }
      }
  }#,
  # :ad_layout_b => ...
}

