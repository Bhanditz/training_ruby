#!/usr/bin/env ruby
class Customer
  attr dollars, snacks, name 

  def initialize(dollars, snacks, name)
    @dollars, @name = dollars, name
    @snacks = []
  end

  def buy(store, snack, quantitV
    store.snacks.get(snack, quantity, self)
  end
end

class Food
  attr name, quantity, cost

  def initialize(name, quantity, cost)
    @name, @quantity, @cost = name, quantity, cost 
  end  
end

class Store
  attr treasure_chest, snack_cost, profit

  def initialize
    @treasure_chest, @profit = 0
    @snack_cost = 0.75
  end
end

dima = Customer.new(2, "Dima")
patrick = Customer.new(1, "Patrick")
kristen = Customer.new(4, "Kristen")

customers = [dima, patrick, kristen]



__END__
store = {:treasure_chest => 0,
  :snack_cost => 0.75,
  :nate_profit => 0}

food = {
  :chocolate => {:quantity => 5, :cost => 0.7},
  :almonds => {:quantity => 3, :cost => 0.5}}

dima = { :name => "Dima",
  :dollars => 2,
  :chocolate => 0,
  :almonds => 0}

patrick = { :name => "Patrick",
  :dollars => 1,
  :chocolate => 0,
  :almonds => 0}

kristen = { :name => "Kristen",
  :dollars => 4,
  :chocolate => 0,
  :almonds => 0}

customers = [dima, patrick, kristen]


def show_stats(customers, store, food)
  customers.each do |c|
    puts "#{c[:name]} has #{c[:dollars]} dollars, #{c[:chocolate]} chocolate bars, #{c[:almonds]} almond packs"
  end
  puts "Treasure chest has #{store[:treasure_chest]} dollars"
  puts "There are #{food[:chocolate][:quantity] + food[:almonds][:quantity]} snacks left"
  food.each do |name, features|
    puts "There are #{features[:quantity]} pieces of #{name} left"
  end
  puts "Nate made #{store[:nate_profit]} dollars today"
end

def buy_something(customer, snack, quantity, store, food)
  puts "#{customer[:name]} is hungry..."
  if quantity > food[snack][:quantity]
    to_order = quantity - food[snack][:quantity]
    quantity = food[snack][:quantity]
    puts "Sorry out of #{snack} we will bring #{to_order} more tomorrow!"
  end
  customer[:dollars] -= store[:snack_cost] * quantity
  store[:treasure_chest] += store[:snack_cost] * quantity
  store[:nate_profit] += (store[:snack_cost] - food[snack][:cost]) * quantity
  food[snack][:quantity] -= quantity
  customer[snack] += quantity
  puts "#{customer[:name]} bought #{snack}"
  if customer[:dollars] < 0
    puts "You owe #{customer[:dollars]} dollars buddy!"
  end
end

show_stats(customers, store, food)
sleep 2
puts

puts 'Go and get my snacks!'

sleep 2
puts

buy_something(dima, :chocolate, 3, store, food)

sleep 2
puts

buy_something(patrick, :chocolate, 1, store, food)

sleep 2
puts

buy_something(kristen, :almonds, 2, store, food)
buy_something(kristen, :chocolate, 2, store, food)

sleep 2
puts

show_stats(customers, store, food)
