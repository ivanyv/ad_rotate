class Layouts
  def self.get(layout)
    { :car =>
      { :image_strip =>
          { :left   => [ 'left1', 'left2' ],
            :center => 'center',
            :right  => [ 'righta', 'rightb']
          },
        :with_block =>
          { :blocks =>
              { :first  => 'first',
                :second => 'second',
                :third  => 'third',
                :fourth => 'fourth',
                :fifth  => 'fifth',
                :sixth  => 'sixth',
              },
            :big_ad =>
              { :left   => 'BIGLEFT',
                :center => 'BIGCENTER',
                :right  => 'BIGRIGHT'
              }
          }
      }
    }[layout]
  end
end

class AdLayout
  def initialize(layout)
    @layout = Layouts.get(layout)
  end

  def ad_rotate(placement)
    yield Ad.new(@layout[placement])
  end
end

class Ad
  def initialize(placement)
    @slots = placement
  end

  def rotate(slot)
    unless @slot
      @slot = @slots.keys.rand
      @ad = @slots[@slot].is_a?(Array) ? @slots[@slot].rand : @slots[@slot]
    end

    if block_given?
      if slot == @slot && !@arrangement_selected
        @arrangement_selected = true
        yield Ad.new(@ad)
      end
    else
      return @ad if slot == @slot
    end
  end
end

