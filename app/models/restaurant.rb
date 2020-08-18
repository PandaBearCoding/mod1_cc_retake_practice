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


end 