# HWK_03
Eva Belevska

# Creating and naming variables

## Create a variable called x and use it to store the result of the calculation (3\*(4+2).

``` r
x <- (3*(4+2))
```

## Calculate the product of x (from the above question) times π.

``` r
x * pi
```

    [1] 56.54867

## Use the getwd() function to show your current working directory. Is that a good working directory, and what program do you think set it that way?

``` r
getwd()
```

    [1] "/Users/eva/Desktop/Semester 5/MICRO475"

#### I think that this would be a good working directory because there was no error message. For example, if the program gave me an error code that said (!is.null(WD)) then that directory would not work and you would have to set it to another one. Furthermore, this directory is specifically for this class, which will keep my files organized if I have other projects I am using R for. I think the progeam that sets it that way is R.

# Vectors

## Use the c() function to create a vector of numbers.

``` r
c(333, 123, 546)
```

    [1] 333 123 546

## Use the c() function to create a vector of characters.

``` r
c("apples", "bananas" , "oranges")
```

    [1] "apples"  "bananas" "oranges"

### Use the : implicit function to create a vector of integers from 1 to 10.

``` r
1:10
```

     [1]  1  2  3  4  5  6  7  8  9 10

## Remove (delete) every variable in your workspace.

``` r
rm(v1, v2, x)
```

    Warning in rm(v1, v2, x): object 'v1' not found

    Warning in rm(v1, v2, x): object 'v2' not found

## Explain why the following code returns what it does. Also address whether you think this was a good decision on the part of the designers of R?

#### The code has an error message because you are trying to add three numbers to four numbers. You need to have the same amount of numbers in each script in order to add them together. I think that this was a good decision because the program wouldn’t know what to do with the last number and it could potentially do something you did not intend for it to do.

## Explain what the following code does. It may be helpful to reference the answer to the previous question:

#### The code is adding 3 to each number in vector.

# Graphics

## Load the tidyverse package. NOTE: Be sure to use the chunk option message=FALSE to suppress the messages that tidyverse prints when loaded. These messages are useful in the

``` r
library(tidyverse)
```

    ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ✔ dplyr     1.1.3     ✔ readr     2.1.4
    ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ✔ ggplot2   3.4.3     ✔ tibble    3.2.1
    ✔ lubridate 1.9.2     ✔ tidyr     1.3.0
    ✔ purrr     1.0.2     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

## Recreate the visualization of body_mass_g to flipper_length_mm, from the penguins data set, that is shown in question 8 of section 2.2.5 of R4DS.

<img src="HWK_03_plot.png" data-fig-align="left" />

## Explain why each aesthetic is mapped at the level that it is (i.e., at the global level, in the ggplot() function call, or at the geom level, in the geom_XXX() function call). Note: A lot of different options will work, but some options are clearly better than others.

#### The reason as to why the aesthetics are plotted in the global level is because we want them to apply to the rest of the chart. Everything in the global level is passed down to the other levels as well. Therefore, that is why we want to establish what is on the x and y axis and what we want the color to represent. However, we then map the color aesthetic at the geom_point because we want to plot it at the local level. When plotting things at the local level, you are taking things that are plotted at the global level and adding to them.
