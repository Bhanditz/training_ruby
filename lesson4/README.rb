# vim: set spell:
# = Objects and Methods - Ruby as language designed around OO paradigm
# 
#    1. Ruby consists of objects and dots (the most-used syntactic structure) 
#    2. "Everything is an expression" (vs statement), meaning everything returns something (there are no "void" methods).  For example,
# 
#       returns the value of the expression.
#    3. Method chaining...  (come up with an example here - TODO)
#    4. You can add methods to things dynamically - show an example of defining a method on something in a console
#    5. Introspection - in a console, pull up an object and show that everything can be examined.


# == Objects, dots, and methods are the most ubiquitous elements of any ruby program
# even most operators (for example -, +, *) are actually methods of their objects

'boston'.capitalize
1.+(2)
'Cape'.+(' Cod')
'#'.*(72)

#it is not convenient to write 1.+(2) so there is a syntactic sugar added to operator constracts
1 + 2
'Cape' + 'Cod'
'#' * 72


