class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] = [] }
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

    def hire(string)
        @teachers.push(string)
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        Integer(@students.length / @teachers.length)
    end

    def add_grade(student, grade)
        if @students.include?(student)
            @grades[student].push(grade)
            true
        else
            false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        return nil if @grades[student].length == 0 || !@students.include?(student)
        all_grades = @grades[student]
        avg = (all_grades.sum / all_grades.length).floor
    end

end
