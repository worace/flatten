class CustomArray

  def initialize(array)
    @arr = array
    @output = []
  end

  def flatten
    flattener(@arr)
    @output
  end

  def flattener(element)
    if element.class == Array
      element.each { |e| flattener(e) }
    else
      @output << element
    end
  end
end

