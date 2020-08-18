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

    # helper for the most_expensive class method 

    def average_price
        self.menu_item.reduce(0){ |sum, price| sum + (price.rating/self.menu_item.count) }
    end 

    #class 
    def self.most_expensive_item
        self.all.max { |menu_item_a, menu_item_b| menu_item_a.average_rating <=> menu_item_b.average_rating }
    end 

end 