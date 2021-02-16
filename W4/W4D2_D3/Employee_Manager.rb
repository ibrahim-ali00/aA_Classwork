require "byebug"
class Employee
    attr_reader :employee_name, :title, :salary, :boss
    attr_accessor 
    def initialize(employee_name, title, salary, boss = nil)
        @employee_name = employee_name
        @title = title
        @salary = salary
        @boss = boss
    end

    def boss=(boss_name)
        @boss = boss_name
    end

    def bonus(multiplier)
        self.salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
        
    end

    def add_employee(employee)
        self.employees << employee
    end

    def bonus(multiplier)
        sum = 0
        people = []
        people.concat(self.employees)
        
        while !people.empty?
            person = people.shift
            sum += person.salary
            if person.is_a?(Manager)
                person.employees.each do |emp|
                    people << emp
                end
            end
        end
        sum * multiplier
    end


end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, nil)
shawna = Employee.new("Shawna", "TA", 12000, nil)
david = Employee.new("David", "TA", 10000, nil)
ned
darren
shawna.boss=(darren)
darren.boss=(ned)
david.boss=(darren)

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)
ned.employees

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)