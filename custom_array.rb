class CustomArray
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def brandon_flatten(array=data, result=[])
    array.reduce(result) do |result, element|
      if element.class == Array
        brandon_flatten(element, result)
      else
        result + [element]
      end
    end
  end

  def loop_flatten
    acc = []
    while data.any?
      current = data.shift
      if current.is_a?(Array)
        @data = current + data
      else
        acc << current
      end
    end
    acc
  end

  def flatten(acc = [], data = data)
    if data.empty?
      acc
    else
      if data.first.is_a?(Array)
        flatten(acc, data.first + data[1..-1])
      else
        flatten(acc + [data.first], data[1..-1])
      end
    end
  end

  def josh_konr
    stage1 = @data.reduce([]) {|ary, v| ary + v}
    stage1.flat_map {|v| v}
  end

  def monkey_flatten
    data.monkey_flatten
  end
end

class CustomArray
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def monkey_flatten
    data.monkey_flatten
  end
end

class Array
  def monkey_flatten
    map(&:monkey_flatten).reduce(:+)
  end
end

class Object
  def monkey_flatten
    [self]
  end
end
