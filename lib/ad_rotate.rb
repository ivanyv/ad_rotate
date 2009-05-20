module AdRotate
  attr_accessor_with_default :ads_path, 'app/ads'

  def full_ads_path
    File.join(RAILS_ROOT, AdRotate.ads_path)
  end
  
  def get_ad_layout(layout)
    filename = File.join(full_ads_path, layout.to_s) + '.rb'
    filename = File.join(full_ads_path, 'all.rb') unless File.exists?(filename)
    filename
  end

  class AdLayout
    def initialize(layout)
      layout_file = File.read(AdRotate.get_ad_layout(layout))
      @layout = eval(layout_file)[layout]
    end

    def rotator(placement)
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
end

