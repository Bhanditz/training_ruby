
=Topics

==Refactoring

Refactoring is an art of making code 'better'. During previous lesson we learned that DRY (Do not Repeat Yourself) is one of the cornerstone principles behind programming. Lesson 1 contains a code that models a snack self-serve store that is written with much of the code repeating many times. We will try to use procedural approach to programming to organize the code. The purpose of refactoring is not to add new functionality, but to improve code from architectural point of view. Usually refactored code behaves the same way from the user point of view, but is quite different under the hood.

==Procedural approach.

If you ever bought a furniture, or a bike that needs to be assembled before usage you saw an example of procedural approach. Step by step instruction tell what to do and some steps might have decision forks, and some might be repetitive and organized in loops. Variables and constants help to keep commonly used values from being 'hard coded' all over the code, functions (also sometimes called procedures, methods, routines...) allow to break code into logical pieces and allow to abstract repetitive work. Sometimes functions are organized into libraries, which can be distributed separately from the rest of the code and reused in many different projects. 

Procedural approach gave birth to very complex and stable systems, Linux kernel, and whole Unix environment mostly written in procedural language C and are good examples of success stories of this paradigm.


=Home work

We did improve our code, and now it is a good time to enhance the model of the store. Currently our model allows to buy more snacks than  the store actually have. It is also possible to spend more money than a customer of the store actually has. Modify the code in such a way that makes it impossible to buy depleted snacks, also issue a warning to remind customer to note how much money they own to the store if they overspend. Also look for the lines of code that can be further abstracted into functions.


