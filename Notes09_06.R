# You can recognize a function when there is a parenthesis symbol.
### Think of functions as a food truck because you tell the food truck what you want, but you cannot see what is going on in the back.

getwd()
# The function above can tell you the Working Directory. 

# implicit functions
3 + 4
3*4
3^4

# Getting help with functions. Use a question mark to get help with a function. For implicit functions use back ticks `` to get help.
?getwd
?`+`

# Comparison functions - these are functions that only return true, false, or N/A. The exclamation mark is read as NOT.
1 == 1
1 != 2
1 < 2
2 <= 1

# Storing variables/object. This is read as a sign the number two to the object or variable x. Think of it like 2 going into x. 
x <- 2
### Storing variables/objects using an equal sign is discouraged because the equals sign does a lot and can mean different things in different contexts.
x = 2
# When you just type x, R-autoprints the value of x to the console if you do not finish the sentence.
x 
### We almost always want to assign our functon resuls to a variable and then we can do stuff with the variable because then our work can be saved. 

#Variable Names

###When naming variables, ensure that they have descriptive names! 
average.tree.height
average_tree_height #Drew prefers underscores.
averageTreeHeight
average-tree-height #DO NOT TO THIS! THIS IS WRONG!

# Vectors (atomic vectors)
tree.height <- c(4.4, 2.2, 1.7, 9.8)
# Everything withing a vector must be the same data type, and it must be one dimenstional.
# c() makes vactores (for concatenate)
tree.index <- 1:4 # You can also use a colon to create a vector
seq(from =3.4, to = 7.89, length.out =4)

# Vectors of other data types
tree.names <- c("oak" , "elm", "pine", "chestnut")

# Combining data types 
tree.height + tree.index
tree.height + tree.names # Obviously this sometimes cannot work because, in this instance, you cannot add numbers to words.

# If you want to keep track of which is which, you can use the following:
height.is.4.4 <- tree.height == 4.4
tree.index + height.is.4.4 # Do we really want this to work?

bad.vec.1 <- c(1, 2, 3.3) # This has to be a double pricision vector. 
bad.vec.2 <- c(1.1, "oak" , "pine")

#Accessing elements of vectors 
tree.height[1] #this gives us the first element of the tree.height vector
tree.height[1:3] #This gives us the first three elements
tree.height[c(1,4)]
tree.height[c(TRUE, FALSE, FALSE, FALSE)]
 # when you are feeding in true false vectors it needs to be the same length
tree.height[tree.height <3] 
# the above gives you only the data points for which this is true

# Querying workspace
ls() # ls() means everything in the workspace
rm("bad.vec.1") #removes things from the workspace
 # this command will remove everything from your workspace
# IF YOU CLEAR YOUR WORKSPACE, YOU ARE NEVER GETTING IT BACK
###It is recommended that you write your code on a script, so that if it gets deleted you will still have everything. Your script and your raw data is what is valuable, not the workspace.
##### Try to clear your workspace frequently, but TRIPLE-CHECK that you have everything saved on a script.




