class Restaurant_owner # CARYN SAYS: should be RestaurantOwner! 
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

    #OO

    #return array of all restaurant instances for restaurant_owner
    def restaurant  # CARYN SAYS: should be restaurant*s*! 
        Restaurant.all.filter do |restaurant|
            restaurant.restaurant_owner == self #restaurant_owner is self
    end

    #return array of all menu_item instances for restaurant_owner
    def menu_items
        # CARYN SAYS: make use of the restaurants method above. You already filtered once!
        # Don't do it again! 
        # Also MenuItems don't have a restaurant_owner method. They have a restaurant method and an owner method
        Menu_item.all.filter do |menu_items|
            menu_items.restaurant_owner == self #restaurant_owner is self
    end 

     #AGGREGATE & ASSOCIATION

     def average_age # CARYN SAYS: this should be a class method! 
        # CARYN SAYS: it will need to get the average age of all RestaurantOwner instances
        # ? How can you access all RestaurantOwner instances ? Then think reduce!
        self.age.reduce(0){ |sum, age| sum + (age.owner/self.age.count) }
     end 

     def sell_restaurant(restaurant, buyer)
        # CARYN SAYS: lets chat! 
        #@ Caryn at a loss here
     end 

end 