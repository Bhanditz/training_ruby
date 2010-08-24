#!/usr/bin/env ruby

# This example is taken from http://www.khelll.com/blog/ruby/ruby-introspection/ 
# most usefule examples are put in boxes

a = 5
b = "Hello"

# What is the object's id?
# +-------------+
# | a.object_id |
# +-------------+
a.object_id
b.object_id

# Whats is your class?
# +---------+
# | a.class |
# +---------+
p "Class of a : #{a.class} ,class of b : #{b.class}" # =>"Class of a : Fixnum ,class of b : String"
 
# Whats is your super class? (parent of a class)
# +--------------------+
# | a.class.superclass |
# +--------------------+
p "Super class of a : #{a.class.superclass} ,super class of b : #{b.class.superclass}" # =>"Super class of a : Integer ,super class of b : Object"
 
# Is a.class = Fixnum ?
a.instance_of? Fixnum # => true
 
# Is a of type Integer (does it have Integer in it's class hierarchy)?
# +----------------+
# | a.is_a? Fixnum |
# +----------------+
a.is_a? Fixnum # => true
a.is_a? Integer # => true
a === Fixnum # the same
 
# Or this way:
a.kind_of? Integer # => true
 
# Introspection, know all the details about classes :
# List all ancestors(modules and classes) of a class
String.ancestors.each{|a| p a}
 
# List all modules included in a class
String.included_modules.each{|m| p m} 
 
# Check class hierarchy
String < Comparable # => true
String < Integer # => nil  , strings r not integers
Object < String # => false , Not all objects are strings
 
# List ancestors of class type
String.ancestors.select{|a| a.class==Class}.each{|c| p c}
 
# List all methods available to an object
b.methods.each{|m| p m}
 
# Get public instance methods
String.public_instance_methods.each{|m| p m}
 
# Get protected instance methods
String.protected_instance_methods.each{|m| p m}
 
# Get private instance methods
String.private_instance_methods.each{|m| p m}
 
# Get class singleton methods
String.singleton_methods{|m| puts m}
 
# Get the instance variables of an object
d = Date.new
d.instance_variables.each{|i| p i}
 
# Get public instance methods
# +-------------------------+
# | d.public_methods        |
# | d.public_methods(false) |
# +-------------------------+
d.public_methods.sort.each{|m| puts m}
d.public_methods(false) # exclude inherited methods
 
# Get protected instance methods
d.protected_methods.each{|m| puts m}
 
# Get private instance methods
d.private_methods.each{|m| puts m}
 
# Get instance singleton methods
d.singleton_methods.each{|m| puts m}

# Determines whether the object has a public or protected method with the specified name.
# +----------------------+
# | s.respond_to? :slice |
# +----------------------+
'some text'.respond_to? :slice #=>true
 
# Or
String.respond_to? :include #=> false
 
# Passes true as the second argument to check private methods as well.
String.respond_to? :include , true #=> true
 
# Check whether some module includes another
module M1 ; end
module M2 ; include M1 ; end
M2.include? M1 #=> true
 
# Check whether instance variable is defined or not.
d=Date.new
d.instance_variables #=> ["@sg", "@of", "@ajd"]
d.instance_variable_defined? "@of" #=>true
 
# Check if a method is defined
# +-----------------------------+
# | 'hi'.method_defined? :slice |
# +-----------------------------+
String.method_defined? :slice! # => true 
 
# Check if public method is defined?
String.public_method_defined? :upcase     # => true
 
# Check if protected method is defined?
String.protected_method_defined? :downcase  # => false 
 
# Check if private method is defined?
String.private_method_defined? :initialize # => true 
 
# Check local variables
# +-----------------+
# | local_variables |
# +-----------------+
local_variables
# or in a form of a hash
vars = local_variables.inject({}) {|res,var| res[var] = eval(var.to_s); res}
 
# Check class variables
class One ; @@var1 = 1 ; end
class Two < One ; @@var2 = 2 ; end
One.class_variables   #=> ["@@var1"]
Two.class_variables   #=> ["@@var2", "@@var1"]
 
# Check constants
Math.constants #=> ["PI", "E"]
 
# Check global variables
global_variables #=> ["$fileutils_rb_have_lchmod", "$binding", "$-w", "$:", "$.", "$KCODE", "$-F", "$*", "$stderr", "$,", "$`", "$-p", "$\"", "$$", "$<", "$@", "$-v", "$-i", "$deferr", "$\\", "$=", "$;", "$PROGRAM_NAME", "$stdout", "$&", "$fileutils_rb_have_lchown", "$-d", "$LOAD_PATH", "$-a", "$VERBOSE", "$FILENAME", "$defout", "$-0", "$+", "$0", "$stdin", "$~", "$DEBUG", "$-I", "$_", "$-K", "$>", "$/", "$'", "$-l", "$LOADED_FEATURES", "$?", "$SAFE", "$!"]
 
# How to get the name of the current method?
# Add this snippet of code to your logic somewhere
 
module Kernel
  private
  # Defined in ruby 1.9
  unless defined?(__method__)
    def __method__
      caller[0] =~ /`([^']*)'/ and $1
    end
  end
end
# Also i strongly recommend that you look at the ObjectSpace module which contains a number of routines that interact with the garbage collection facility and allow you to traverse all living objects with an iterator, however this is a little example taken from the official api documentation :
# 
#ObjectSpace.each_object([module]) {|obj| ... } => fixnum
#Calls the block once for each living, nonimmediate object in this Ruby process. If module is specified, calls the block for only those classes or modules that match (or are a subclass of) module. Returns the number of objects found. Immediate objects (Fixnums, Symbols true, false, and nil) are never returned. In the example below, each_object returns both the numbers we defined and several constants defined in the Math module.
 
a = 102.7
b = 95       # Won't be returned
c = 12345678987654321
count = ObjectSpace.each_object(Numeric) {|x| p x }
puts "Total count: #{count}"
 
#=>12345678987654321
#102.7
#2.71828182845905
#3.14159265358979
#2.22044604925031e-16
#1.7976931348623157e+308
#2.2250738585072e-308
#Total count: 7

