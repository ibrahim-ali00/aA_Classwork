class Employee  

    attr_reader :name, :title, :salary, :boss 

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss 
    end

    def bonus(multiplier)
        salary * multiplier
    end

end


class Manager < Employee

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        
    end

end