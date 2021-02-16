class TowersOfHanoi
  attr_accessor :disks

  def initialize
    @disks = [[1, 2, 3, 4], [], []]
  end

  def move(start_tower, end_tower)
    if !disks[end_tower].first.nil?
      raise "cannot move a larger disk onto a smaller disk!" if disks[start_tower].first > disks[end_tower].first
    end

    disk = @disks[start_tower].shift
    @disks[end_tower].unshift(disk)
  end

  def won?
    if @disks[0].empty? && @disks[1].empty?
      puts "Won!"
      return true
    end
    false
  end

  def play
    until won?
      puts "Enter a start tower and an end tower: "
      user = gets.chomp
      break if user == "quit"
      user = user.split(" ")
      start = user[0].to_i
      last = user[1].to_i
      move(start,last)
      p @disks 
    end
  end
end
