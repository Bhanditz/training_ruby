#!/usr/bin/env ruby

store = {:treasure_chest => 0,
:chocolate => 5,
:almonds => 3,
:chocolate_cost => 0.7,
:almonds_cost => 0.5, 
:snack_cost => 0.75,
:nate_profit => 0}

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


def show_stats(customers, store)
  customers.each do |customer|
    puts "#{customer[:name]} has #{customer[:dollars]} dollars, #{customer[:chocolate]} chocolate bars, #{customer[:almonds]} almond packs"
  end
  puts "Treasure chest has #{store[:treasure_chest]} dollars"
  puts "There are #{store[:chocolate] + store[:almonds]} snacks left"
  puts "Nate made #{store[:nate_profit]} dollars today"
end

def buy_something(customer, snack, quantity, store)
  puts "#{customer[:name]} is hungry..."

  customer[:dollars] -= store[:snack_cost]
  store[:treasure_chest] += store[:snack_cost] * quantity
  store[:nate_profit] += (store[:snack_cost] - store[:chocolate_cost]) * quantity
  store[snack] -= quantity
  customer[snack] += quantity
  puts "#{customer[:name]} bought #{snack}"
end

show_stats(customers, store)
sleep 2
puts

puts 'Go and get my snacks!'

sleep 2
puts

buy_something(dima, :chocolate, 1, store)

sleep 2
puts

buy_something(patrick, :chocolate, 1, store)

sleep 2
puts

buy_something(kristen, :almonds, 2, store)

sleep 2
puts

show_stats(customers, store)
