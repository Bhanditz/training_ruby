#!/usr/bin/env ruby

treasure_chest_money = 0
store_chocolate = 5
store_almonds = 3
almonds_cost = 0.50
chocolate_cost = 0.70
snack_cost = 0.75
nate_profit = 0

dima_name = "Dima"
dima_dollars = 2
dima_chocolate = 0

patrick_name = "Patrick"
patrick_dollars = 1
patrick_chocolate = 0

kristen_name = "Kristen"
kristen_dollars = 4
kristen_almonds = 0

puts "Dima has #{dima_dollars} dollars, #{dima_chocolate} chocolate bars"
puts "Patrick has #{patrick_dollars} dollars, #{patrick_chocolate} chocolate bars"
puts "Kristen has #{kristen_dollars} dollars, #{kristen_almonds} almonds packs"
puts "Treasure chest has #{treasure_chest_money} dollars"
puts "There are #{store_chocolate + store_almonds} snacks left"
puts "Nate made #{nate_profit} dollars today"

sleep 2
puts

puts 'Go and get my snacks!'

sleep 2
puts

puts "Dima is hungry..."

dima_dollars -= snack_cost
treasure_chest_money += snack_cost
nate_profit += snack_cost - chocolate_cost
store_chocolate -= 1
dima_chocolate += 1

puts "Dima bought chocolate"

sleep 2
puts

puts "Patrick is hungry"

patrick_dollars -= snack_cost
treasure_chest_money += snack_cost
nate_profit += snack_cost - chocolate_cost
store_chocolate -= 1
patrick_chocolate += 1

puts "Patrick bought chocolate"

sleep 2
puts

puts "Kristen is hungry"

kristen_dollars -= snack_cost * 2
treasure_chest_money += snack_cost * 2
nate_profit += (snack_cost - almonds_cost) * 2
store_almonds -= 2
kristen_almonds += 2

puts "Kristen bought almonds"

sleep 2
puts

puts "Day is over, so who has what?"
puts
puts "Dima has #{dima_dollars} dollars, #{dima_chocolate} chocolate bars"
puts "Patrick has #{patrick_dollars} dollars, #{patrick_chocolate} chocolate bars"
puts "Kristen has #{kristen_dollars} dollars, #{kristen_almonds} almonds packs"
puts "Treasure chest has #{treasure_chest_money} dollars"
puts "There are #{store_chocolate + store_almonds} snacks left"
puts "Nate made #{nate_profit} dollars today"



