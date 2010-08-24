# Structure of Ruby
# 
#    1. Review basic variable types: ints, floats, strings, arrays, and hashes - Explain how these also allow introspection and have methods that can be defined on them.
#    2. (this may be confusing, but Operators as methods. ...Possibly redefine the #+ on Fixnum (and/or on 1, specifically) to give an example.
#    3. Examples of "built-in" objects/classes: Date, Time, etc... things you get for "free"
#    4. Require and Load... how they differ may be a bit advanced, but they'll need to hear it multiple times before it sinks in, anyway.  :)
#    5. Examples of a loadable class ... maybe ruby-debug and:
#    6. kernel, module, classes, and methods... the "structure" of language.  are objects and outline the structure of ruby in those terms.
#

# All datatypes are objects

# Numbers hiararchy is quite involved 
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

# All numbers are unmutable
a = 1
b = 1
p (a.object_id == b.object_id) # => true

1.class # => Fixnum
999999999999999999999999.class # => Bignum
(999999999999999999999999/5555555555555).class # => Fixnum
