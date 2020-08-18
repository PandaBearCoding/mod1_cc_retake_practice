require 'pry'

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
        # CARYN SAYS: Use your helper methods! Remember that a restaurant does not have a recipe method
        # buuuut you could find all restaurants associated with menu_items that belong to this Recipe instance
        Restaurant.all.filter do |restaurant|
            restaurant.recipe == self #recipe is self 
    end 

    #AGGREGATE & ASSOCIATION
    #This is a helper method to do variations of price methods(i.e., avergae, highest, cheapest)
    def price 
        # CARYN SAYS: the idea of the helper is really good but there are improvements to be made:
        # 1. use your menu_items helper method
        # 2. Theoretically you'd want an array of all prices for menu_items that belong to this Recipe instance
        #     so once you have an array of menu_item instances associated with this Recipe instance
        #     you can map over them to create an array with their prices instead 
        Menu_item.all.filter do |price|
          price.recipe == self #Recipe is self
    end 

    #0 = initial sum
    #We want all prices for the current recipe - a specific instance
    #Ruby will look within this class for price - acting on current instance and calling the instance price method 
    def average_price
        # CARYN SAYS: make sure you're testing! I can tell you didn't because menu_item should be pluralized
        # like the method defined above 
        self.menu_item.reduce(0){ |sum, price| sum + (menu_item.price/self.menu_item.count) }
    end 

    
    #We want to return a recipe instance with the highest average price --> one recipe instance with the highest average price 
    #***What have I already created? --> average_price ***
    def highest_price
        # CARYN SAYS:the way you describe this above is incorrect! Reread the README
        # It should be the integer price for the most expensive listing of this recipe 
        Recipe.all.max { |recipe_a, recipe_b| recipe_a.average_price <=> recipe_b.average_price }
    end 

    #Opposite of highest_price, still leveraging average_price
    def cheapest_price
        # CARYN SAYS: this should be cheapest restaurant! 
        Recipe.all.min { |recipe_a, recipe_b| recipe_a.average_price <=> recipe_b.average_price }
    end 

    #This is a class method 
    #We want to return array of recipes not being sold --> not a menu_items
    def Recipe.inactive
        # CARYN SAYS: your logic is close here but lets talk through a easier way
        # essentially, if a Recipe#menu_items or Recipe#restaurants is empty, then we know it's not listed
        # So we can filter over all Recipe instances (ie Recipe.all) and grab just those that have an empty array
        # for menu_items 
        if menu_items.!include?(recipe)
            Recipe.inactive = self.recipe.find {|menu_item| menu_item.recipe == recipe}
        end 
      end 


end 

binding.pry