# HMK 08 template

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

``` r
library(dplyr)
library(nycflights13)

flights2 <- flights |> 
  select(year, time_hour, origin, dest, tailnum, carrier)
flights2 |> 
  left_join(airlines) |> 
  nrow()
```

    Joining with `by = join_by(carrier)`

    [1] 336776

``` r
nrow(flights2)
```

    [1] 336776

# Joins

1.  Imagine you’ve found the top 10 most popular destinations using this
    code:

``` r
top_dest <- flights2 |>
  count(dest, sort = TRUE) |>
  head(10)
```

How can you find all flights to those destinations?

``` r
all_flights <- top_dest |>
  left_join(flights)
sum(is.na(flights2$name))
```

    [1] 0

``` r
select(flights, dest)
```

    # A tibble: 336,776 × 1
       dest 
       <chr>
     1 IAH  
     2 IAH  
     3 MIA  
     4 BQN  
     5 ATL  
     6 ORD  
     7 FLL  
     8 IAD  
     9 MCO  
    10 ORD  
    # ℹ 336,766 more rows

# Functions

2.  Write a function to ‘rescale’ a numeric vector by subtracting the
    mean of the vector from each element and then dividing each element
    by the standard deviation.

``` r
v <- (1:5)

rescale <- function(v) {
  ( v - mean(v, na.rm = TRUE)) / sd(v, na.rm = TRUE)
}

rescale(v)
```

    [1] -1.2649111 -0.6324555  0.0000000  0.6324555  1.2649111
