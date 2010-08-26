# vim: set spell:

#    1. Blocks
#    2. Introduction to Monkey Patching


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

#  == Reusing Blocks

c = Proc.new {|i| "hello #{i}"}
#Ruby 1.9 
c = proc {|i| "hello #{i}"}


a = [1,2,3,5,6]
b = ['a','b','c','d']
# a.map {|i| "hello #{i}"}
# 
# b.map {|i| "hello #{i}"}

p a.map(&c)

p b.map(&c)

# Procs are blocks promoted to be objects

c.call(1)
c['World']


# = Introduction to Monkey Patching
# There is nothing sacred in Ruby...
# Monkey patching is a common practice (somewhat dangerous)
obj = 'hello'

def obj.continue
  self.to_s + ' world'
end

puts obj.continue
