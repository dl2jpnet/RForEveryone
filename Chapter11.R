##############################################################################
# Chapter 11 - Group Manipulation
# A general rule of thumb for data analysis is that manipulating the data
# (or data munging) consumes about 80% of the effort.
# This often requires repeated operations on different sections of the data
# "split-apply-combine"
##############################################################################

##############################################################################
# 11.1 Apply Family
# Built into R is the apply function and all its relatives such as tapply,
# lapply, mapply
##############################################################################

# 11.1.1 apply - must be used on a matrix. Uses 3 first arguments to work
# 1st - object to work on, 2nd - margin to apply the function over (1 to operate
# on rows, 2 to operate on columns), 3rd - function to apply

# build the matrix
the_matrix <- matrix(1:9, nrow = 3)
# sum the rows
apply(the_matrix, 1, sum)
# sum the columns
apply(the_matrix, 2, sum)
# alternatively can be achieved using the built-in functions of rowSums, colSums
rowSums(the_matrix)
colSums(the_matrix)

# evaluate how to handle the NA data element using na.rm
the_matrix[2, 1] <- NA
apply(the_matrix, 1, sum)
apply(the_matrix, 1, sum, na.rm = TRUE)
rowSums(the_matrix)
rowSums(the_matrix, na.rm = TRUE)

# 11.1.2 lapply and sapply -
# lapply works by applying a function to each element of a lists and returning
# the results as a list
the_list <- list(A = matrix(1:9, 3), B = 1:5, C = matrix(1:4, 2), D = 2)
lapply(the_list, sum)

# dealing with list can be cumbersome, so to return the results of lapply as a
# vector instead, use sapply
sapply(the_list, sum)

# because a vector is technically a form of list, lapply and sapply can also
# take vector as their inpur
the_names <- c("Jared", "Deb", "Paul")
lapply(the_names, nchar)

# 11.1.3 mapply
# Applies a function to each element of multiple lists. Often when confronted
# with this scenario,
# the fallback is to use loop, which is certainly not necessary

## build 2 lists
first_list <- list(A = matrix(1:16, 4), B = matrix(1:16, 2), C = 1:5)
second_list <- list(A = matrix(1:16, 4), B = matrix(1:16, 8), C = 15:1)

# test element by element if they are identical
mapply(identical, first_list, second_list)

## build a simple function that adds the number of rows (or length) of each
# corresponding element
simple_func <- function(x, y) {
  NROW(x) + NROW(y)
}

# apply the function to the 2 lists
mapply(simple_func, first_list, second_list)

##############################################################################
# 11.2 Aggregate
# Similar to running aggregation and grouping on SQL
##############################################################################
require(ggplot2)
data(diamonds)
head(diamonds)

# calculate average price for each type of cut: Fair, Good, Very Good,
# Premium and Ideal
# 1st arg - price to be grouped by cut, 2nd arg - data to use, 3rd
# arg - function
# to apply to each subset of the data
aggregate(price ~ cut, diamonds, mean)

# to further group by more than one variable
aggregate(price ~ cut + color, diamonds, mean)

# to aggregate 2 variables, they must be combined using the cbind on the left
# side of the formula
# this would find the mean price of both price and carat for each value of cut
aggregate(cbind(price, carat) ~ cut, diamonds, mean)

# to further expand on the above, you can also provide more than 2 variables
# on the right side
aggregate(cbind(price, carat) ~ cut + color, diamonds, mean)

##############################################################################
# 11.3 plyr
# Consists of functions such as ddply, llply, ldply
# 1st letter indicates the type of input
# 2nd letter indicates the type of output
##############################################################################
