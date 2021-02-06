class Waiter

    attr_accessor :name, :years_experience

    @@all = []

    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        best_tipper_meal = meals.max do |meal_1, meal_2|
            meal_1.tip <=> meal_2.tip
        end
        best_tipper_meal.customer
    end

end