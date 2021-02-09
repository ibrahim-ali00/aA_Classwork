require 'byebug'
class Board
    def initialize(n)
        @grid = Array.new(n){Array.new(n,:N)}
        @size = n * n
    end

    def size
        @size
    end

    def [](pos)
        row = pos[0]
        column = pos[1]
        @grid[row][column]
    end

    def []=(pos, val)
      x = pos[0]
      y = pos[1]
      @grid[x][y] = val
    end

    def num_ships
      count = 0
      @grid.flatten.each do |ele|
        if ele == :S
          count += 1
        end
      end
      count
    end

    def attack(pos)
      if self[pos] == :S
        self[pos] = :H
        p "you sunk my battleship!"
        return true
      else
        self[pos] = :X
        return false
      end
    end

    def place_random_ships
        ship_count = @size / 4
        new_arr = @grid.flatten
        i = 0
        while i < ship_count
          new_arr[i] = :S
          i += 1
        end
        shuffled = new_arr.shuffle
        j = 0
        k = 0
        l = 0
        while j < @grid.length
          while k < @grid.length
            @grid[j][k] = shuffled[l]
            l += 1
            k += 1
          end
          j += 1
          k = 0
        end
    end

    def hidden_ships_grid
        new_grid = @grid.map(&:clone)
        i = 0
        j = 0
        while i < new_grid.length
            while j< new_grid.length
                if new_grid[i][j] == :S
                    new_grid[i][j] = :N
                end
                j += 1
            end
            j = 0
            i += 1
        end
        new_grid
    end

    def self.print_grid(arr)
      arr.each do |ele|
        puts ele.join(" ")
        end
    end

    def cheat
      Board.print_grid(@grid)
    end

    def print
      Board.print_grid(self.hidden_ships_grid)
    end
end
