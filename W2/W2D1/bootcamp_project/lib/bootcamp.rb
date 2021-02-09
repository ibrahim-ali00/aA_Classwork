class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{ |k,v| k[v] = []}
    end
    def name
        @name
    end
    def slogan
        @slogan
    end
    def teachers
        @teachers
    end
    def students
        @students
    end
    def hire(teacher)
        @teachers << teacher
    end
    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        elsif @students.length == @student_capacity
            return false
        end
        false
    end
    def enrolled?(student)
        @students.include?(student) 
    end
    def student_to_teacher_ratio
        return students.length / teachers.length
    end
    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student]<<grade
            return true
        else
            return false
        end
    end
    def num_grades(student)
        @grades[student].length
    end
    def average_grade(student)
        if @grades.has_key?(student)
            @grades[student].sum / num_grades(student)
        else
            return nil
        end
    end
end
