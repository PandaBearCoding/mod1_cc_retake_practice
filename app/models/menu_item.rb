class Menu_item 
    attr_reader :restaurant, :recipe
    attr_accessor :price
    @@all = []

    def initialize(restaurant, recipe, price)
        @restaurant = restaurant
        @recipe = recipe
        @price = price
        @@all << self
    end 

    def Menu_item.all
        @@all
    end 


    def owner 
        Restaurant_owner.all.filter do |owner|
            owner.menu_item == self #menu_item is self 
    end 

end 