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

    #OO

    #return array of all restaurant instances for restaurant_owner
    def restaurant 
        Restaurant.all.filter do |restaurant|
            restaurant.restaurant_owner == self #restaurant_owner is self
    end

    #return array of all menu_item instances for restaurant_owner
    def menu_items
        Menu_item.all.filter do |menu_items|
            menu_items.restaurant_owner == self #restaurant_owner is self
    end 

     #AGGREGATE & ASSOCIATION

     #return the average age of all restaurant owners 
     def average_age 
        self.age.reduce(0){ |sum, age| sum + (age.restaurant_owner/self.age.count) }
     end 

     #Transfer ownership of a restaurant to a buyer --> restrautant MUST belong to current owner/user
     #@ Caryn at a loss here
     #Conditionals required to check if current user owns restaurant
     def sell_restaurant(restaurant, buyer)
        if restaurant_owner.include?(restaurant)
            #Then can sell to buyer / new restaurant owner 
            Restaurant_owner.new(name, age)
        else #if current user does not own restaurant
            buyer_to_update = self.restaurant_owner.find { |buyer| buyer.restaurant == restaraunt_owner}
            buyer_to_update = restaraunt_owner
        end 
    end 


end 