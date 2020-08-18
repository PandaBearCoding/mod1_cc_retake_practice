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
        Restaurant_owner.all.filter do |owner|
            owner.menu_item == self #menu_item is self 
    end 

    #AGGREGATE & ASSOCIATION

    #This is a helper for the most_expensive class method 
    def average_price
        self.menu_item.reduce(0){ |sum, price| sum + (menu_item.price/self.menu_item.count) }
    end 

    #This is a class method, leveraging average_price
    def self.most_expensive_item
        self.all.max { |menu_item_a, menu_item_b| menu_item_a.average_price <=> menu_item_b.average_price }
    end 

end 