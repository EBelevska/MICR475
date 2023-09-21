# Creating and naming variables 

## Create a variable called x and use it to store the result of the calculation (3*(4+2).
```{r}
> x <- (3*(4+2))
```

## Calculate the product of x (from the above question) times π.
```{r}
> x * pi
[1] 56.54867
```

## Use the getwd() function to show your current working directory. Is that a good working directory, and what program do you think set it that way?
```{r}
> getwd()
[1] "/Users/eva/Desktop/Semester 5/MICRO475"
```
#### I think that this would be a good working directory because there was no error message. For example, if the program gave me an error code that said (!is.null(WD))

# Vectors 
## Use the c() function to create a vector of numbers.
```{r}
> c(333, 123, 546)
[1] 333 123 546
```

## Use the c() function to create a vector of characters.
```{r}
c("apples", "bananas" , "oranges")
[1] "apples"  "bananas" "oranges"
```

### Use the : implicit function to create a vector of integers from 1 to 10.
```{r}
> 1:10
[1]  1  2  3  4  5  6  7  8  9 10
```

## Remove (delete) every variable in your workspace.
```{r}
rm(v1, v2, x)
```

## Explain why the following code returns what it does. Also address whether you think this was a good decision on the part of the designers of R?
#### The code has an error message because you are trying to add three numbers to four numbers. You need to have the same amount of numbers in each script in order to add them together. I think that this was a good decision because the program wouldn't know what to do with the last number and it could potentially do something you did not intend for it to do. 

## Explain what the following code does. It may be helpful to reference the answer to the previous question:
#### The code is adding 3 to each number in vector. 

# Graphics
## Load the tidyverse package. NOTE: Be sure to use the chunk option message=FALSE to suppress the messages that tidyverse prints when loaded. These messages are useful in the
```{r}
library(tidyverse)
```

## Recreate the visualization of body_mass_g to flipper_length_mm, from the penguins data set, that is shown in question 8 of section 2.2.5 of R4DS.
```{r}
ggplot(data = penguins, 
       mapping = aes(x=flipper_length_mm, y=body_mass_g, color = bill_depth_mm)) +
  geom_point(aes(color = bill_depth_mm)) +
  geom_smooth(se = FALSE)
```

## Explain why each aesthetic is mapped at the level that it is (i.e., at the global level, in the ggplot() function call, or at the geom level, in the geom_XXX() function call). Note: A lot of different options will work, but some options are clearly better than others.
#### The reason as to why the 