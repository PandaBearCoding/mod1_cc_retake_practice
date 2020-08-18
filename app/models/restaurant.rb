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

    def menu_items
        Menu_item.all.filter do |menu_items|
            menu_items.restaurant == self #restaurant is self
        end 

    def recipes
        Recipe.all.filter do |recipe|
            recipe.restaurant == self #restaurant is self
    end 

     # AGGREGATE & ASSOCIATION

     def has_dish?(recipe)
        #check if dish in on menu
        #if yes, return true
        #if no, return false
        if menu_item.include?(recipe)
            return true 
        else 
            return false
        end
     end 
    
     # helper for highest_rated class method 
     def average_star_rating
        self.average_star_rating.reduce(0){ |sum, star_rating| sum + (star_rating.rating/self.star_rating.count) }
      end 

     #class 
     def self.highest_rated
        self.all.max { |restaurant_a, restaurant_b| restaurant_a.average_star_rating <=> restaurant_b.average_star_rating }
     end 

end 