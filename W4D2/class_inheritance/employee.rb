class Employee  

    attr_reader :name, :title, :salary, :boss 

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss 
    end

    def bonus(multiplier)
        salary * multiplier
    end

    def add_employees(employee)
        @boss.employees << employee
    end

end


class Manager < Employee

    attr_reader :employees
    def initialize(name, title, salary, boss)
        super
        @employees = [] # => [bob, susan, dennis, ibrahim] 
    end

    def bonus(multiplier)
        queue = [] 
        sum = 0 
        @employees.each do |employee|
            queue << employee 
        end
        until queue.empty?
            first = queue.shift 
            sum += first.salary 
            first.employees.each do |ele|
                if ele.is_a?(Manager)
                    queue << ele
                end
            end
        end
        sum * multiplier
    end

    

# !is_a?(Manager) / create a helper function -> calculate total salary with recursion 
# if not a manager add to sum 
# employee instances 
# bfs 

end

ned = Manager.new('ned', 'Founder', 1000000, nil)
darren = Manager.new('darren', 'TA Manager', 78000, ned)
shawna = Employee.new('shawna', 'TA', 12000, darren)
david = Employee.new('david', 'TA', 10000, darren)
darren.add_employees(david)
darren.add_employees(shawna)
ned.add_employees(darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000