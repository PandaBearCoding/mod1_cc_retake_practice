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

    #OO

    #return array of all owner (restaurant_owner) instances for menu_item
    def owner 
        # CARYN SAYS: there's an easier way! you know which restaurant the MenuItem belongs to
        # and the restaurant belongs to an owner
        # so we can self.restaurant.owner ! 
        Restaurant_owner.all.filter do |owner|
            owner.menu_item == self #menu_item is self 
    end 

    # helper for the most_expensive class method 

    # CARYN SAYS: you over complicated this one a lil bit! most expensive didn't need you to do any averaging! 
    def average_price
        self.menu_item.reduce(0){ |sum, price| sum + (price.rating/self.menu_item.count) }
    end 

    #class 
    def self.most_expensive_item
        self.all.max { |menu_item_a, menu_item_b| menu_item_a.average_rating <=> menu_item_b.average_rating }
    end 

end 