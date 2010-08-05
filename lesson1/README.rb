#!/usr/bin/env ruby

# Helpful links: 

# Learning Ruby in 20 mintutes: http://www.ruby-lang.org/en/documentation/quickstart/

# Try Ruby: http://tryruby.org/ 

# 1. Hello World

puts 'Hello World!'

# 2. Comments are documentation for humans (with few exceptions)

# 3. Assignments

x = 3 # => variable x is not 3

x = x + 1 # => variable x is now 4

# 4. Types

x = nil # nil is 'nothing' or no value

x = 1 # x is a number

x = 'one' # x is a string

x = "one" # same thing but double quotes have a bit different purpose like

x = "#{x} and two" # will be equal one and two

x = '#{x} and two' # will be equal '#{x} and two' 

x = [1, 2, 3, 4] # x is an array (list) which contains 4 numbers

x[0] # => 1
x[-1] # => 4

x = {'a' => 1, 'b' => 2} # x is a dictionary or 'hash' where value can be looked up by a key 'a' and 'b' are keys
x['a'] # => 1
x['b'] # => 2

# 5. Loops and Forks

# It was proven mathematically in 1960s that all you need to write a program of any complexity is forks and loops

#   5A. Forks

x = 1

if x > 0
  y = 3
else
  y = 8
end

unless x == 2 # equality of values are checked with ==, because = is for assignments of values
  y = 5
end

# or the same in 'more English'

y = 5 if x == 2

#    5B. Loops

# A 'classical' loop

for i in [1,2,3]
  puts i
end

# Almost the same but much more 'popular' in ruby:

[1,2,3].each do |i|
  puts i
end


# while loops

x = 0

while x < 10
  x = x + 1
  puts x
end

# until loops

x = 0 
x = x + 1 until x < 10

# loops also have statements 'break' 'next', 'redo'

# 6. However there is a rule -- 'Do not duplicate yourself' which brings a lot of additional complexity for a reason

# the rule 'Do not duplicate yourself' can be bent or broken or ignored for good and bad reasons

# All complexities of programming (variables, constants, functions, classes, modules, aspects, design patterns etc.) are consequences of this rule.

# We need this rule because

# - We are not machines

# - We have to maintain written code

# - World around us is changing...

# 7. Excessive copy and paste in coding is similar to excessive slash and burn in agriculture

# 8. Refactoring is an art of decreasing duplication 
