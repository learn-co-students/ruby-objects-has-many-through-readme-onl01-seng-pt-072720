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
    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end
    def meals
        Meal.all.select {|m| m.waiter == self}
    end
    def best_tipper
        self.meals.sort_by {|m| m.tip}.last.customer
    end
end