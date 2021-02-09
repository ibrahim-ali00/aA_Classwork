class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |ele| POSSIBLE_PEGS.has_key?(ele.upcase) }
  end

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map do |ele|
        ele.upcase
      end 
    else
      raise "error"
    end
  end

  def pegs
    @pegs
  end

  def self.random(length)
    arr = []
    length.times do 
      arr << POSSIBLE_PEGS.keys.sample
    end
    Code.new(arr)
  end

  def self.from_string(str)
    Code.new(str.split(""))
  end

  def [](idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code_1)
    count = 0
    i = 0
    while i < code_1.length
      if code_1[i] == @pegs[i]
        count += 1
      end
      i += 1
    end
    count
  end

  def num_near_matches(code_1)
    count = 0
    i = 0
    while i < code_1.length
      if code_1[i] != @pegs[i] && @pegs.include?(code_1[i])
        count += 1
      end
      i += 1
    end
    count
  end

  def ==(code_1)
    if code_1.length != @pegs.length
      return false
    else 
      i = 0
      while i < code_1.length
        if code_1[i] != @pegs[i]
          return false
        end
        i += 1
      end
    end
    true
  end
end
