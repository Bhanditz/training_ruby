# :vim set spell:
# Structure of Ruby
#
#    1. Comments
# 
#    2. Identifiers
#
#    3. Review basic variable types: ints, floats, strings, arrays, and hashes - Explain how these also allow introspection and have methods that can be defined on them.
#    4. (this may be confusing, but Operators as methods. ...Possibly redefine the #+ on Fixnum (and/or on 1, specifically) to give an example.
#    5. Examples of "built-in" objects/classes: Date, Time, etc... things you get for "free"
#    6. Require and Load... how they differ may be a bit advanced, but they'll need to hear it multiple times before it sinks in, anyway.  :)
#    7. Examples of a loadable class ... maybe ruby-debug and:
#    8. kernel, module, classes, and methods... the "structure" of language.  are objects and outline the structure of ruby in those terms.

# Comments

# No multiline comments except
=begin
  this is also a comment
  but it is multiline
  You can comment out blocks of code this way
=end

# = Identifiers

# Consists: letters, underscore, numbers, numbers cannot be first

# 21a - not a valid identifier
# 
# however utf-8 chars are allowed in ruby 1.9
# Аня = 3

# var_1 - normal variable
# CONSTANT - (sort of)
# Constant - class or module name
# ALSO_CONSTANT - class or module
# AlsoConstant - class or module
# 
# $global_variable
# 
# @instance_variable
# 
# @@class_variable
# 
# boolean_method?
# 
# in_place_method!
# 
# setter=
# 


#

# All data types are objects

# Numbers hierarchy is quite involved 
# 
#                            +-------+
#                            |Numeric|
#                            +-------+
#                                |
#            +---------+---------+------------+-------------+
#            |         |         |            |             |
#        +-------+  +-----+  +-------+   +----------+   +--------+
#        |Integer|  |Float|  |Complex|   |BigDecimal|   |Rational|
#        +---+-+-+  +-----+  +-------+   +----------+   +--------+
#            |
#       +----+----+
#       |         |
#   +---+--+  +---+---+
#   |Fixnum|  |Bignum |
#   +------+  +-------+

# All numbers are immutable
a = 1
b = 1
p (a.object_id == b.object_id) # => true

#Fixnum and Bignum numbers automatically handled
1.class # => Fixnum
999999999999999999999999.class # => Bignum
(999999999999999999999999/5555555555555).class # => Fixnum

3/2 # => 1 
3/2.0 # => 1.5

#If it helps you can write integers like this too
1_000_000 # => same as 1000000

# Float numbers are close to real numbers but not precise, so not good to count money
1/6.0 # => 0.166666666666667

0.3 - 0.2 == 0.1 # => false
# so you can do that (sloooow)
require 'bigdecimal'
BigDecimal('0.3') - BigDecimal('0.2') == BigDecimal('0.1')

# to work with 2/3 + 5/7 use Rational type

Rational(2,3) + Rational(5,7) # => Rational(29, 21)

# Strings are mutable

'one two'
a = 'two'
b = 'three'
"one #{two}"
"one %s %s" % [a, b]

# escapes 
'\'one\' two three'
"\"one\" %s %s" % [a,b]

# same with 'custom quotes'
%q-'one' two three-
%Q-"one" %s %s- % [a,b]

# Symbols
# immutable strings
:a
:"also a symbol"
a = "too"
:"a symbol #{a}"
"convert to symbol".to_sym

:symbol_to_string.to_s

# Arrays
[1,2,3]
a = [] # initialize array
a = Array.new #same but much more wordy
                                                   
# +--Special case-----------------------------------+
# | if you don't know b == 3 or [1,2,3]             |
# | instead of                                      |
# | a = b.is_a? Array ? b : [b]                     |
# | use                                             |
# | a = Array(b) # but be careful with b = {:a => 2}|
# +-------------------------------------------------+

%w(one two thee) # => ["one", "two", "three"] 

# Hashes

{:a => 2, :b => 3}
#in Ruby 1.9 this is also correct
{a:2, b:3}

# Ranges
(2..10).to_a # => [2,3,4,5,6,7,8,9,10]
(2...10).to_a # => [2,3,4,5,6,7,8,9]
'abcd'[0..2] # => 'abc'

# Flip-flops -- an interesting way to use ranges:
[1,2,3,4,5,6,7,8,9,10,9,8,7,6,5,4,3,2,1].select {|i| i if i==3..i==5} # => [3,4,5,3,2,1]
# flip flop starts from being false
# it flips to true when left statement becomes true
# it flips back to false when right statement evaluates to true
# Useful to work with selecting specific parts of a text;
# in this example start printing when meet TODO word in line and stop when meet empty line
open('my_file').each { |line| print line if line ~= /TODO/..line =~ /^$/ }

# Booleans
true
false
#false is either false or nil

# nil
nil

# There border between 'primitive' data types and other data types is fuzzy, usually you do have to load other data types to use them.

require 'time'

Time.now

# There are two commands you can use -- require and load. Load happens every time it is called, require works only first time per file

require 'time' # will do nothing second time

load 'time'
load 'time' # will work every time

require 'set'

a = [1,2,3,3,3,3,3,4,4,5,5].to_set



# =Operators
# Operators are syntactic tokens which represent an operation performed on one or more objects (operands). 
# Line between operators and methods is VERY fuzzy.
# You can look them up here
# http://www.tutorialspoint.com/ruby/ruby_operators.htm

# Most of operators are actually methods of basic data types
# Cherry picking a few things to remember:

# = assignment operator allows parallel assignments
a, b, c = 1, 2, 3
a, b = b, a # useful if you need to swap values of variables

# &&, and, ||, or
# &&, and are both operators for 

# &&, || have higher precedence than  and, or
# I prefer &&, || because of less surprises
# Jeremy prefers and, or because of better readability

# defined?
# useful operator if you do not know if something is defined already

# ||=
a ||= b 
#the same is 
a = a || b # if a is false, then assign b to a

# rescue

a ||= some_method rescue c
# if some_method throws an exception this expression  assigns c to a

# ternary operator
# ?:
b = (a == 3) ? a : c

# Operators can be dynamically overloaded (another example of Monkey patching)
class Fixnum
  def +(a_num)
    8
  end
end

puts 1 + 3

