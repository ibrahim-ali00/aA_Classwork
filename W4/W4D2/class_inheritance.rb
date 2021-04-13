class Employee
    attr_reader :salary, :title, :boss, :name
    def initialize(name, title, salary, boss=nil)
        @name, @title, @salary, @boss = name, title, salary, boss
        set_subordinates
    end

    def bonus(multiplier)
        @salary * multiplier
    end

    def set_subordinates
        current_employee = self
        current_boss = self.boss
        until current_boss.nil?
            current_boss.subordinates << current_employee
            current_boss = current_boss.boss
        end
    end

    def inspect
        @name
    end

end

class Manager < Employee
    attr_reader :subordinates

    def initialize(name, title, salary, boss=nil)
        @subordinates = []
        super(name, title, salary, boss)
    end

    def bonus(multiplier)
        total = 0
        @subordinates.each do |sub|
            total += sub.salary
        end
        total * multiplier
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000