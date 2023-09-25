# In-class Assignment 09/25
Eva Belevska

## In-class Assignment 09/25/23

``` r
library(tidyverse)
library("readr")
library(tidyr)

read_csv("fake_eagle_nest_counts.csv") -> eagle_nests
```

I would say that this is not tidy because of the different regions. In
order to get the data to be tidy, I would combine the different regions
into one and then plot the year on the x-axis and the number of eagle’s
nests on the y-axis.

``` r
eagle_data <- eagle_nests|>
  pivot_longer(cols = !starts_with("year"),
              names_to = "regions",
              values_to = "nests")
```

Creating a scatter plot with the data:

``` r
x <- eagle_data$year
y <- eagle_data$nests
plot(x, y, main = "Eagle Nests", 
     xlab = "years", ylab = "regions",)
```

![](In-class-Assignment-9-25_files/figure-commonmark/unnamed-chunk-3-1.png)
