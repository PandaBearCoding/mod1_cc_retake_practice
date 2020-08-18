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

     # AGGREGATE & ASSOCIATION

     def average_age 
        self.age.reduce(0){ |sum, age| sum + (age.owner/self.age.count) }
     end 

     def sell_restaurant(restaurant, buyer)
        
     end 



end 