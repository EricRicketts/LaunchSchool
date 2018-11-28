## Practice Test

### Problem 1

1.  In lines 3-12 a Song class is defined with two instance methods.
2.  In lines 5-7 #intialize is defined taking one parameter, the local
variable lyrics is used to initialize the instance variable @lyrics.
#initialize initializes a Song object.
3.  In lines 9-11, instance method #sing_me_a_song prints out a list
of lines within the @lyrics instance variable.  It returns the @lyrics
array.
4.  In lines 14-18 a lyrics local variable is initialzed with an array of
strings.
5.  In line 20 a local variable happy_birthday is initialized with a new
Song object.  ::new is called on the Song class and with the local variable
lyrics as its argument, it returns an object from the Song class.
6.  In line 21 of the code the happy_birthday local variable which references
a Song object invokes the #sing_me_a_song instance method.  A series of strings
is output and the value returned is the @lyrics instance variable. 

### Problem 2

1.  In lines 3-9 module MyStuff is defined wtih a constant and one module method.
2.  In line 4 the constant TANGERINE is assigned a String object of value "Living reflection of a dream"
3.  In lines 6-8 a module method apple() is defined which outputs a string and returns nil.
4.  In lines 11 the module method is called which outputs a string and returns nil.
5.  In line 12 the constant is referenced using the namespace resolution operator and the string is output
and nil is returned.

### Problem 3

1.  In lines 3-8 a class Parent is defined with one instance method #implicit.  This method outputs
a string and returns nil.
2.  In lines 10-11 the Child class is defined and it is subclassed to the Parent class.  It has no
declared instance methods.  Via inheritance the Child class inherits #implicit from the Parent class.
3.  In line 13 the local variable dad is assigned the object returned by invoking ::new on the Parent class.
4.  In line 14 the local variable son is assigned the object returned by invokign ::new on the Child class.
5.  In lines 16 and 17 #implicit is called on the Parent object and then the Child object.  In each case
the same string is output with a return value of nil.

### Problem 4

1.  In lines 3-8 of the code a Parent class is defined with one instanc method #override, this method outputs a
string and returns nil.
2.  In lines 10-15 of the code, a Child class is declared which inherits from the Parent class.  In lines 12-14 of the
code the Child class overrides the inherited method #override from the Parent class.
3.  In line 17 of the code the local variable dad is assigned the object returned by calling ::new on the Parent class.
4.  In line 18 of the code the local variable son is assigned the object returned by calling ::new on the Child class.
5.  In line 20 of the code the dad local variable invokes the instance mehtod #override which outputs "PARENT override()" string
and returns nil.
6.  In line 21 of the code the son local variable invokes the instance method #override which outputs "CHILD overrde()" string
and returns nil.  The output in lines 20 and 21 are different because the Child class overrode the inhertied #override.

### Problem 5

1.  In lines 3-7 a Parent class is defined with one instance method, #altered, this method outputs a string and returns nil.
2.  In lines 9-15 a Child class is defined which inherits from the Parent class and then overrides the inherited #altered
3.  In lines 10-14, #altered is redefined for the Child class in which it first outupts a string then calls Parent#altered via
#super and then outputs another string and finally returns nil.
4.  In lines 17 of the code the dad local variable is assigned the Parent object returned by invoking Parent::new
5.  In lines 18 of the code the son local variable is assigned the Child object returned by invoking Child::new
6.  In line 20 of the code the dad object invoked #altered which outputs the string "PARENT altered()" and returns nil.
7.  In lines 21 of the code the son object invokes #altered which outputs 3 strings and returns nil.