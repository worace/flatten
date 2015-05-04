class CustomArray

  attr_reader :array, :new_array

  def initialize(array)
    @array = array
    @new_array = []
  end

  def flatten
    if flattened?
      @array
    else
      flat(@array)
    end
  end

  def flat(array)
    if array.is_a?(Array)
      if array.any?{|e| e.is_a?(Array)}
       array.each {|e| flat(e) }
      else
        array.each {|e| @new_array << e}
      end
    else
      @new_array << array
    end
    @new_array
  end

  def flattened?
    @array.to_s.chars.count("[") == 1 && @array.to_s.chars.count("]") == 1
  end

end
