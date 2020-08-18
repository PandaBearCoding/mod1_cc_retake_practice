# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end


madeline = Restaurant_owner.new("Madeline", 25)
derek = Restrautant_owner.new("Derek", 29)

flame = Restaurant.new("Wendy", "Flame", 5) #@ Caryn if you like hibachi - after corona, TRY THIS (in midtown)! 
pastabilities = Restaurant.new("Robert", "Pastabilities", 5)

item1 = Menu_item.new(flame, cake, 20) # needs objects passed in --> instances are created, now we can use objects
item2 = Menu_item.new(pastabilities, cookie, 5)

rec1 = Recipe.new("cake", "chocolate everything") # needs objects passed in --> instances are created, now we can use objects
rec2 = Recipe.new("cookie", "giant, NO raisons")



# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
