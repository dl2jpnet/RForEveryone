##############################################################################
# Chapter 09 - Control Statements
##############################################################################

##############################################################################
# 9.1 if and else
# Logical operator with ==, <, >, <=, >=, !=
##############################################################################
as.numeric(TRUE)

to_check <- 1
if (to_check == 1) {
  print("hello")
}
if (to_check == 0) {
  print("hello")
}

# first create the function
check_bool <- function(x) {
  if (x == 1) {
    # if the input is equal to 1, print hello
    print("Hello")
  } else if (x == 0) {
    # otherwise print goodbye
    print("Goodbye")
  } else {
    print("Confused")
  }
}

check_bool(1)
check_bool(0)
check_bool("k")
check_bool(TRUE)

##############################################################################
# 9.2 switch
# Check multiple cases
##############################################################################
use_switch <- function(x) {
  switch(x,
         "a" = "first",
         "b" = "second",
         "z" = "last",
         "c" = "third",
         "other")
}

use_switch("a")
use_switch("b")
use_switch("c")
use_switch("d")
use_switch("e")
use_switch("z")

##############################################################################
# 9.3 ifelse
# Similar to the if function in Excel
# accepts 1st argument as condition, 2nd argument as value returned if its true
# more useful if you'd like to test on a vector
##############################################################################

# see if 1 == 1
ifelse(1 == 1, "yes", "no")
ifelse(1 == 0, "yes", "no")
to_test <- c(1, 1, 0, 1, 0, 1)

ifelse(to_test == 1, "Yes", "No")
ifelse(to_test == 1, to_test * 3, to_test)

to_test[2] <- NA
ifelse(to_test == 1, "Yes", "No")
ifelse(to_test == 1, to_test * 3, to_test)

##############################################################################
# 9.4 Compound Tests
# Applied when you want to test more than 1 relationship
# Using logical operator 'and' and 'or'- &, &&, |, ||
##############################################################################
a <- c(1, 1, 0, 1)
b <- c(2, 1, 0, 1)

# this checks each element of a and each element of b
ifelse(a == 1 & b == 1, "Yes", "No")

# this only checks the first element of a and the first element of b, returning
# only 1 result
ifelse(a == 1 && b == 1, "Yes", "No")
