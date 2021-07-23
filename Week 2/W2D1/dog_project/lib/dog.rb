class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def age=(number)
        @age = number
    end

    def bark
        @bark
    end

    def favorite_foods
        @favorite_foods
    end

    def bark
        if @age > 3
            return @bark.upcase
        else @age <= 3
            return @bark.downcase
        end
    end

    def favorite_food?(food)
        @favorite_foods.any? { |fave_food| fave_food.downcase == food.downcase }
    end
end
