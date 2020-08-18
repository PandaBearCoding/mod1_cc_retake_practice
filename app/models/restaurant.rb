class Restaurant 
    #attr_reader :owner ?
    attr_accessor :owner, :name, :star_rating
    @@all = []

    def initialize(owner, name, star_rating)
        @owner = owner
        @name = name
        @star_rating = star_rating
        @@all << self
    end 

    def Restaurant.all
        @@all
    end 

    #OO 

    #return array of all menu_item instances for restaurant 
    def menu_items
        Menu_item.all.filter do |menu_items|
            menu_items.restaurant == self #restaurant is self
        end 

    #return array of all recipe instances for restaurant
    def recipes
        Recipe.all.filter do |recipe|
            recipe.restaurant == self #restaurant is self
    end 

     #AGGREGATE & ASSOCIATION

    #We need to check if dish in on menu
    #If yes, return true
    #If no, return false
    def has_dish?(recipe)
        if menu_item.include?(recipe)
            return true 
        else 
            return false
        end
     end 
    
     #We need a helper method for highest_rated class method 
     def average_star_rating
        self.average_star_rating.reduce(0){ |sum, star_rating| sum + (restaurant.star_rating/self.star_rating.count) }
      end 

     #This is a class method - leveraging average_star_rating 
     def self.highest_rated
        self.all.max { |restaurant_a, restaurant_b| restaurant_a.average_star_rating <=> restaurant_b.average_star_rating }
     end 

end 