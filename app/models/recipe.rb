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

    #OO 

    #return array of all menu_item instances for Recipe  
    def menu_items 
        Menu_item.all.filter do |menu_item|
            menu_item.recipe == self #recipe is self 
    end 

     #return array of all restaurant instances for recipe
    def restaurants
        Restaurant.all.filter do |restaurant|
            restaurant.recipe == self #recipe is self 
    end 

    #AGGREGATE & ASSOCIATION
    #This is a helper method to do variations of price methods(i.e., avergae, highest, cheapest)
    def price 
        Menu_item.all.filter do |price|
          price.recipe == self #Recipe is self
        end
      end 

    #0 = initial sum
    #We want all prices for the current recipe - a specific instance
    #Ruby will look within this class for price - acting on current instance and calling the instance price method 
    def average_price
        self.menu_item.reduce(0){ |sum, price| sum + (menu_item.price/self.menu_item.count) }
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