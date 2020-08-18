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

    #AGGREGATE & ASSOCIATION

    # CARYN SAYS: you over complicated this one a lil bit! most expensive didn't need you to do any averaging! 
    def average_price
        self.menu_item.reduce(0){ |sum, price| sum + (menu_item.price/self.menu_item.count) }
    end 

    #This is a class method, leveraging average_price
    def self.most_expensive_item
        self.all.max { |menu_item_a, menu_item_b| menu_item_a.average_price <=> menu_item_b.average_price }
    end 

end 