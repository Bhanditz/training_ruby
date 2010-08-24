# vim: set spell:

# = Objects and Methods - Ruby as language designed around OO paradigm
# 
#    1. Object Oriented approach to programming 
#    2. Ruby consists of objects and dots (the most-used syntactic structure) 
#    3. "Everything is an expression" (vs statement), meaning everything returns 
#       something (there are no "void" methods).  For example,
#       returns the value of the expression.
#    4. Method chaining...  (come up with an example here - TODO)
#    5. You can add methods to things dynamically - show an example of defining a method on something in a console
#    6. Introspection - in a console, pull up an object and show that everything can be examined.


# == Object Oriented approach to programming
#
# === Procedural approach
#
#   using procedures (aka functions or methods)
#   it is similar in following instructions to assemble furniture from a store
#
#
# === Object Oriented approach
#
#   Objects have data and behavior. Object as a result have responsibility. Objects interact with each other 
#   using messages. Objects have inheritance and polymorphism. For example imagine a lecturer tells his students
#   to go to their next lecture:
# 
#                              +-Person---------------+
#                              |                      |
#                              | def next_lecture()   |
#                              |   nil                |
#                              | end                  |
#                              |                      |
#                              +-----------+----------+
#                                          |
#                                          | 
#          +--------------------------+-----------+-----------+-------------------+
#          |                          |                       |                   |
#          |                          |                       |                   |
# +-Medical Student------+ +-Biology Student------+ +--Math Student------+ +-Janitor------+
# |                      | |                      | |                    | |              |
# | def next_lecture()   | | def next_lecture()   | | def next_lecture() | |              |
# |   next_medical_class | |   next_biology_class | |   next_math_class  | |              |
# | end                  | | end                  | | end                | |              |
# |                      | |                      | |                    | |              |
# +----------------------+ +----------------------+ +--------------------+ +--------------+
#
#   == Everything is an object in Ruby
#     Objects, dots, and methods are the most ubiquitous elements of any ruby program
#     even most operators (for example -, +, *) are actually methods of their objects
#
#   C language data types are not objects
#     int x;
#   Java has object types and non-object types 
#     int x;
#     Integer y = new Integer(1);
#  
#   Most programming languages have data types which are mixture of objects and non-objects, or non-objects
#   Ruby is different -- all data types in ruby are objects and it is super cool! It is cool because everything
#   in ruby behaves predictably. Ruby objects interact with each other by sending messages. Messages are methods
#   exposed for external use.


"Hi".downcase # Most of ruby expressions work with objects and their methods.

#  
#   == Introspection
#
#   one great advantage of such design -- you can inspect everything the same way
#   
1.public_methods.sort
1.public_methods(false).sort # not inherited methods only
1.class # => Fixnum
1.class.superclass # => Integer
'eol'.is_a? String
'eol'.respond_to? :slice
local_variables


#   more about introspection:
require 'introspection'


#   == Object, dot, method

'boston'.capitalize
1.+(2)
'Cape'.+(' Cod')
'#'.*(72)

#it is not convenient to write 1.+(2) so there is a syntactic sugar added to operator constructs
1 + 2
'Cape' + 'Cod'
'#' * 72

# = Everything is expression
#
# Statements return no value, expressions do. Everything in ruby is expression and returns a value.

if 1 == 1 then x = 4 end # => 4

2 # => 2

x = 5 # => 5

# Interesting consequence of that -- it is possible to chain expressions together letting them feed on each other similar to unix pipes

['encyclopedia', 'Life'].join(' of ').capitalize.reverse[0..3].upcase

if Time.now.hour.between?(12, 13)
  'Lunch'
else
  'Something else'
end + ' time'

# Simple expressions return themselves, for example expression 4 returns 4
# Everything can be chain to everything, but if a method is missing chain would break

# = Blocks
# Blocks change how you work with loops the most.
# Blocks make your functions very flexible.
# Flow control goes to blocks by using 'yield'
def my_func
  x = yield "Hi "
  puts x + '!'
  'method returns this string'
end

my_func {|str| str + ' world'}

# blocks are pieces of code separated wither by { and } or by 'do' and 'end'
# both syntax structures are almost identical, by convention {,} are used for one-liners, 'do', 'end' for multi-line blocks.

#loops can be done in a traditional way
for a in [1,2,3]
  puts a
end

# Arrays, hashes, strings are things that can be traversed through -- they all are Enumerables. All Enumerables have method 'each'
[1,2,3].each {|a| puts a} #uses block of 'each' method
{'a' => 1, 'b' => 2}.each {|key,val| puts key}

# Say you want to modify data in a Enumerator

[1,2,3].map {|a| 'a' * a} # => ["a", "aa", "aaa"] 

# Or you want to filter some data out
['one', 'two', 'three'].select {|a| a.match /o/} # => ["one", "two"]

# Or you want to split data into 2 'buckets'
['one', 'two', 'three'].partition {|a| a.match /o/} # => [["one", "two"], ["three"]]

# Or you can do cumulative things: 
[1, 2, 3].inject(0) {|res, n| res += n} # => 6
[1, 2, 3].inject({}) {|res, n| res[n] = 'a' * n; res} # => {1=>"a", 2=>"aa", 3=>"aaa"}


require 'blocks'

# = Dynamic nature of ruby
# There is nothing sacred in Ruby...
# Monkey patching is a common practice (somewhat dangerous)
obj = 'hello'

def obj.continue
  self.to_s + ' world'
end

puts obj.continue
