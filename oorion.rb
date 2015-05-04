class CustomArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def my_flatten
    array.my_flatten
  end

end

class Array
  def flatten_proc
    Proc.new do |array, e|
      if e.class != Array
        array.push(e)
      else
        array += e.my_flatten
      end
    end
  end

  def my_flatten
    self.reduce([]) do |array, e|
      if e.class != Array
        array.push(e)
      else
        array += e.my_flatten
      end
    end
  end
end


