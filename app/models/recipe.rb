class Recipe 
    attr_reader :name
    attr_accessor :description
    @@all = []

    def initialize(name, description)
        @name = name
        @description = description
        @@all << self
    end 

    def Recipe.all
        @@all
    end 

    #return array of all menu_items for recipe 
    def menu_items 
        Menu_item.all.filter do |menu_item|
            menu_item.recipe == self #recipe is self 
    end 

     #return array of all restaurants for recipe 
    def restaurants
        Restaurant.all.filter do |restaurant|
            restaurant.recipe == self #recipe is self 
    end 

    # AGGREGATE & ASSOCIATION
    
    def price #need this helper method to do variations of price methods
        Menu_item.all.filter do |price|
          price.recipe == self #Recipe is self
        end
      end 

    def average_price
        #0 = initial sum
        #Want all prices for the current recipe - a specific instance
        # looks within this class for price - acting on current instance and calls the instances price method
        self.menu_item.reduce(0){ |sum, price| sum + (price.rating/self.menu_item.count) }
    end 

    def highest_price
        #return a recipe instance with the highest average price 
        #want one recipe instance w/ highest average price
        #what have I already created?
        Recipe.all.max { |recipe_a, recipe_b| recipe_a.average_price <=> recipe_b.average_price }
    end 

    def cheapest_price
        Recipe.all.min { |recipe_a, recipe_b| recipe_a.average_price <=> recipe_b.average_price }
    end 

    def Recipe.inactive
        #class
        #return array of recipes not being sold --> not a menu_items
        if menu_items.!include?(recipe)
            Recipe.inactive = self.recipe.find {|menu_item| menu_item.recipe == recipe}
        end 
      end 


end 