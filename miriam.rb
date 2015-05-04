class CustomArray
  attr_reader :arr

  def initialize(arr)
    @arr = arr
  end

  def flatten
    result = []
    tail =  @arr.pop

    if tail.is_a?(Array)
      @arr + tail.flatten
    else
      result << tail
    end
  end
end

