# Question 1
# What do we mean when we refer to the public interface of a class?

# A
# The method lookup path for the class.

# B
# The methods exposed by the class to interact with objects of that class.

# C
# The instance variables that record the state of objects of that class.

# D
# The utility methods used internally by the class.

# Answers:

# ********************************************************************************************************************

# Question 2
# The following is a short description of the application:

# The application lets a customer place an order for a meal.
# A meal always has three meal items: a burger, a side, and drink.
# For each meal item, the customer must choose an option.
# The application must compute the total cost of the order.
# Designing the applications begins with identifying the nouns and verbs from this description;
# we will use these words to model our classes and methods. Which of the following lists best identifies the nouns and
# verbs we need? Remember to keep the context of our description in mind.

# A
# Nouns: customer, order, meal item, burger, side, drink, total, place
# Verbs: choose option

# B
# Nouns: customer, meal item, burger, side, drink
# Verbs: place, order, total, choose option

# C
# Nouns: customer, order, meal item, burger, side, drink
# Verbs: place, total, choose option

# D
# Nouns: place, total, choose option
# Verbs: customer, order, meal item, burger, side, drink

# Answers:

# ********************************************************************************************************************

# As you begin coding, you prepare the following spike for the application. Refer to this spike to answer the remaining questions.

class Customer; end

class Order; end

class MealItem; end

class Burger < MealItem
  OPTIONS = {
    '1' => { name: 'LS Burger', cost: 3.00 },
    '2' => { name: 'LS Cheeseburger', cost: 3.50 },
    '3' => { name: 'LS Chicken Burger', cost: 4.50 },
    '4' => { name: 'LS Double Deluxe Burger', cost: 6.00 }
  }
end

class Side < MealItem
  OPTIONS = {
    '1' => { name: 'Fries', cost: 0.99 },
    '2' => { name: 'Onion Rings', cost: 1.50 }
  }
end

class Drink < MealItem
  OPTIONS = {
    '1' => { name: 'Cola', cost: 1.50 },
    '2' => { name: 'Lemonade', cost: 1.50 },
    '3' => { name: 'Vanilla Shake', cost: 2.00 },
    '4' => { name: 'Chocolate Shake', cost: 2.00 },
    '5' => { name: 'Strawberry Shake', cost: 2.00 }
  }
end

# ********************************************************************************************************************

# Question 3
# Select the class or classes where you can most logically add the following method.

def place_order
  @order = Order.new
end

# A
# Customer

# B
# Order

# C
# MealItem

# D
# Burger, Side, and Drink

# Answers:

# ********************************************************************************************************************

# Question 4
# Which of the below classes is (are) the most logical place for the following methods?

def initialize
  @burger = Burger.new
  @side = Side.new
  @drink = Drink.new
end

def meal
  [@burger, @side, @drink]
end

# A
# Customer

# B
# Order

# C
# MealItem

# D
# Burger, Side, and Drink

# Answers:

# ********************************************************************************************************************

# Question 5
# Which of the below classes is (are) the most logical place for the following methods?

def initialize
  @option = choose_option
end

def choose_option
  puts "Please choose a #{self.class} option:"
  puts item_options # item_options returns a list of options and prices
                    # for a particular item type
  gets.chomp
end

# A
# Customer

# B
# Order

# C
# MealItem

# D
# Burger, Side, and Drink

# Answers:

# ********************************************************************************************************************

# Quesiton 6
# You want to add a #to_s method to the Order class so we can display Order objects. The method should return a
# comma-and-space delimited string that contains the names of the selected items. For example:

my_order.to_s # => "LS Cheeseburger, Fries, Chocolate Shake"
# We write this method like this:

def to_s
  meal.map(&:to_s).join(', ')
end

# Note that this method calls #to_s for each of the MealItem objects returned by #meal, so we also need a MealItem#to_s method.
# It should return the name of the meal item; we get this by looking in the object's OPTIONS constant, which is a nested hash.
# The first key is the @option instance variable, and the second is the :name symbol.

# Which of the following implementations of MealItem#to_s will let Order#to_s work as described? Select all that apply.

# A
def self.to_s
  self::OPTIONS[@option][:name]
end

# B
def to_s
  MealItem::OPTIONS[@option][:name]
end

# C
def to_s
  self.class::OPTIONS[@option][:name]
end

# D
def to_s
  self::OPTIONS[@option][:name]
end
# ********************************************************************************************************************
# Quesiton 7
# You also need an Order#total method; it should return a string that contains the total cost of the meal based on the items selected, for example:

my_order.total # => "$5.49"
# To construct this method, we will use a method named MealItem#cost (not shown here) to get the cost of the selected meal item.
# Here's your first attempt at writing Order#total:

class Order
  def total
    total_cost = @burger + @side + @drink
    format("%.2f", total_cost) # #format formats the cost to two decimal places
  end
end

# Which of the following changes do you need to make to ensure that Order#total returns a value as shown in the example? Select all that apply.

# A
# The code should work as is, without change.

# B
# Change the first line of Order#total to total_cost = burger + side + drink and add burger, side and drink getter methods to Order.

# C
# Add def +(other); self.cost + other.cost; end method to the Order class.

# D
# Change the first line of Order#total to total_cost = @burger.cost + @side.cost + @drink.cost

# Answers:
