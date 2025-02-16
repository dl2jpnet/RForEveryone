##############################################################################
# Chapter 08 - Writing R Functions
##############################################################################

##############################################################################
# 8.1 Hello, World!
# Build a function that simply prints "Hello, World!" to the console
##############################################################################

say_hello <- function() {
  print("Hello, World!")
}

##############################################################################
# 8.2 Function Arguments
# Build a function that allows to process arguments
##############################################################################

# hello person using sprintf and with single argument
hello_person <- function(name) {
  print(sprintf("Hello %s", name))
}
hello_person("Jared")
hello_person("Bob")
hello_person("Sarah")

# hello person with 2 arguments
hello_person <- function(first, last) {
  print(sprintf("Hello %s %s", first, last))
}
# call the function by position
hello_person("Jared", "Lander")
# call the function by name
hello_person(first = "Jared", last = "Lander")
# call the function in the other order
hello_person(last = "Lander", first = "Jared")
# call the function and specify one name
hello_person("Jared", last = "Lander")
# call the function and specify the order
hello_person(first = "Jared", "Lander")
# call the function and specify the 2nd argument first and then provide the
# first argumen
hello_person(last = "Lander", first = "Jared")

# 8.2.1 Default Arguments
hello_person <- function(first, last = "Doe") {
  print(sprintf("Hello %s %s", first, last))
}

# call without specifying last
hello_person("Jared")
# call with a different last name
hello_person("Jared", "Lander")

# 8.2.2 Extra Arguments
# R offers a special operator that allows functions to take an arbitraty number
# of arguments
# that do no need to be specified in the function definition.

# call hello_person with an extra argument
hello_person("Jared", extra = "Goodbye")

hello_person <- function(first, last = "Doe", ...) {
  print(sprintf("Hello %s %s", first, last))
}

hello_person("Jared", extra = "Goodbye")
hello_person("Jared", "Lander", extra = "Goodbye")

##############################################################################
# 8.3 Return Values
# Similar to C or Java programming using the return command
##############################################################################

# first build it without an explicit return
double_num <- function(x) {
  x * 2
}
double_num(5)

# now build it with an explicit return
double_num <- function(x) {
  return(x * 2)
  print("Hello!")
  return(17)
}

##############################################################################
# 8.4 Do Call
# Allows to specify the name of the function either as a character or as an
# object
# and provide arguments as a list
##############################################################################
do.call("hello_person", args = list(first = "Jared", last = "Lander"))
do.call(hello_person, args = list(first = "Jared", last = "Lander"))

run_this <- function(x, func = mean) {
  do.call(func, args = list(x))
}
# finds the mean by default
run_this(1:10)
# specify to calculate the mean
run_this(1:10, mean)
# calculate the sum
run_this(1:10, sum)
# calculate the standard deviation
run_this(1:10, sd)
