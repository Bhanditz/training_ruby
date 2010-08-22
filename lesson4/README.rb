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
#                                        +-Person---------------+
#                                        |                      |
#                                        | def next_lecture()   |
#                                        |   nil                |
#                                        | end                  |
#                                        |                      |
#                                        +-----------+----------+
#                                                    |
#                                                    | 
#            +---------------------------+-----------+------------+------------------------+
#            |                           |                        |                        |
#            |                           |                        |                        |
#   +-Medical Student------+  +-Biology Student------+  +--Math Student--------+ +-Janitor--------------+
#   |                      |  |                      |  |                      | |                      |
#   | def next_lecture()   |  | def next_lecture()   |  | def next_lecture()   | |                      |
#   |   next_medical_class |  |   next_biology_class |  |   next_math_class    | |                      |
#   | end                  |  | end                  |  | end                  | |                      |
#   |                      |  |                      |  |                      | |                      |
#   +----------------------+  +----------------------+  +----------------------+ +----------------------+
#  
#   == Objects, dots, and methods are the most ubiquitous elements of any ruby program
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
#  
#   == Introspection
#
#   one great advantage of such design is that it is easy to see what methods are available for every object.
#   

'boston'.capitalize
1.+(2)
'Cape'.+(' Cod')
'#'.*(72)

#it is not convenient to write 1.+(2) so there is a syntactic sugar added to operator constracts
1 + 2
'Cape' + 'Cod'
'#' * 72


