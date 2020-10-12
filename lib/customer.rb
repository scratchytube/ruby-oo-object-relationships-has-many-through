require 'pry'

class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end


#rachel wants to know about all of her meals
  def meals
    Meal.all.select { |meal| meal.customer == self } 
  end

  #rachel wants to know about all of her waiters
  def waiters
    meals.map { |meal| meal.waiter }
  end

end