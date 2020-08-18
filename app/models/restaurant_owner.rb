class Restaurant_owner
    attr_accessor :name, :age
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end 

    def Restaurant_owner.all
        @@all
    end 

    def restaurant 
        Restaurant.all.filter do |restaurant|
            restaurant.restaurant_owner == self #restaurant_owner is self
    end

    def menu_items
        Menu_item.all.filter do |menu_items|
            menu_items.restaurant_owner == self #restaurant_owner is self
    end 

end 