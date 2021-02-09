# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if !self.empty?
        self.max - self.min
    else
        nil
    end
  end
  def average
      if self.length > 0
        self.sum / (self.length * 1.00)
      else
        nil
      end
  end
  def median
      if self.length > 0
        sorted = self.sort
        length = self.length
        (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
      else
        nil
      end
  end
  def counts
      hash = Hash.new(0)
      self.each do |ele|
        hash[ele] +=1
      end
      hash
  end

  def my_count(val)
    count = 0
    self.each do |ele|
        if ele == val
            count +=1
        end
    end
    count
  end
  def my_index(val)

        if !self.include?(val)
            return nil
        else
            self.each_with_index do |ele, i|
            if ele == val
                return i
            end
        end
    end
  end

  def my_uniq
    hash = {}
    self.each do |ele|
        hash[ele] = 1
    end
    hash.keys
  end

  def my_transpose
    new_arr = []
    length = self.length
    self.each_with_index do |ele, i|
        row = []
        ele.each_with_index do |ele2, j|
            row << ele[j-length]
        end
        new_arr << row
    end
    new_arr
  end
end
