class CustomArray
  def initialize(array)
    @array = array
  end

  def flatten1
    flattened_array = []
    @array.each do |el|
      if el.is_a?(Array)
        CustomArray.new(el).flatten1
      else
        flattened_array << el
      end
      flattened_array
    end
  end

end
