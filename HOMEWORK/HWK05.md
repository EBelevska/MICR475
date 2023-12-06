# HMK 5: Reading and tidying data

# Reading

- [R4DS Chapters 6-9](https://r4ds.hadley.nz/data-import)

# Data import

## Q1:

- Create a directory, within your main class directory, called `data`.
  - Note: in general, you should store raw data in a directory called
    `data`.
- Download the example file for Ch 9 here. Save it inside the `ddata`
  directory.
- Use `read_csv()` to read the file to an R data frame. Follow the
  instructions in Ch 9 to format it properly. Follow the directions in
  Ch 9 to make sure the following are true:
  - Column names should be *syntactic*, meaning they don’t contain
    spaces.
  - N/A values should be represented with the R value `NA`, not the
    character “N/A”.
  - Data types (character vs factor vs numeric) should be appropriate.

``` r
library(tidyverse)
students <- read_csv("Data/students.csv", na = c("N/A", ""))
students |>
  rename(
    student_id = `Student ID`,
    full_name = `Full Name`, 
    favourite_food = `favourite.food`, 
    meal_plan = `mealPlan`,
    age = `AGE`
  ) |>
  mutate(
    meal_plan = factor(meal_plan),
    age = parse_number(if_else(age == "five", "5", age))
    )
```

    # A tibble: 6 × 5
      student_id full_name        favourite_food     meal_plan             age
           <dbl> <chr>            <chr>              <fct>               <dbl>
    1          1 Sunil Huffmann   Strawberry yoghurt Lunch only              4
    2          2 Barclay Lynn     French fries       Lunch only              5
    3          3 Jayendra Lyne    <NA>               Breakfast and lunch     7
    4          4 Leon Rossini     Anchovies          Lunch only             NA
    5          5 Chidiegwu Dunkel Pizza              Breakfast and lunch     5
    6          6 Güvenç Attila    Ice cream          Lunch only              6

## Q2

Find (or make) a data file of your own, in text format. Read it into a
well-formatted data frame.

``` r
lost_pets <- read_csv("Data/Lost__found__adoptable_pets.csv")
lost_pets |>
  rename(Impound_No = `impound_no`) |>
  mutate(Record_Type = factor(Record_Type))
```

    # A tibble: 497 × 25
       Impound_No Animal_ID Data_Source           Record_Type Link  Current_Location
       <chr>      <chr>     <chr>                 <fct>       <chr> <chr>           
     1 K23-160878 A693721   Regional Animal Serv… LOST        http… LOST            
     2 K23-160863 A693693   Regional Animal Serv… FOUND       http… King County Pet…
     3 K23-161832 A695988   Regional Animal Serv… FOUND       http… In RASKC Foster…
     4 K23-161625 A695463   Regional Animal Serv… LOST        http… LOST            
     5 K23-160762 A693508   Regional Animal Serv… FOUND       http… In Public Home  
     6 K23-161424 A695093   Regional Animal Serv… LOST        http… LOST            
     7 K23-161775 A695830   Regional Animal Serv… LOST        http… LOST            
     8 K23-162160 A696624   Regional Animal Serv… FOUND       http… In Public Home  
     9 K23-160973 A693921   Regional Animal Serv… ADOPTABLE   http… King County Pet…
    10 K23-161749 A695764   Regional Animal Serv… FOUND       http… In RASKC Foster…
    # ℹ 487 more rows
    # ℹ 19 more variables: Animal_Name <chr>, animal_type <chr>, Age <chr>,
    #   Animal_Gender <chr>, Animal_Breed <chr>, Animal_Color <chr>, Date <chr>,
    #   Date_Type <chr>, Obfuscated_Address <chr>, City <chr>, State <chr>,
    #   Zip <dbl>, jurisdiction <chr>, obfuscated_latitude <dbl>,
    #   obfuscated_longitude <dbl>, Image <chr>, image_alt_text <chr>, Memo <chr>,
    #   Temperament <chr>

# Tidying

Download the data set available at
<https://tiny.utk.edu/MICR_575_hmk_05>, and save it to your `data`
folder. **This is a real data set:** it is the output from the
evaluation forms for student colloquium speakers in the Microbiology
department. I have eliminated a few columns, changed some of the scores,
and edited comments, to protect student privacy, but the output is real.

First, open this .csv file with Microsoft Excel or a text reading app,
to get a sense of the structure of the document. It is weird.

Why is the file formatted so inconveniently? I have no idea, but I do
know that this is about an average level of inconvenient formatting for
real data sets you will find in the wild.

*Note: In theory, you can pass a URL to `read_csv()` and read the file
directly from the internet. In practice, that doesn’t seem to work for
this file. So you’ll want to download this file to your hard drive.*

## Q3a

Next, use `read_csv()` to read the data into a data frame. Note that
you’ll need to make use of some of the optional arguments. Use
`?read_csv` to see what they are.

*If you are struggling with this task, email me for hints.*

As we discussed in class, the correct shape depends on what you want to
do with the data. Use `pivot_longer()` to make the data frame longer, in
a way that makes sense.

``` r
headers <- names(read_csv("Data/colloquium_assessment.csv", n_max = 0))
                 
colloquium <- read_csv("Data/colloquium_assessment.csv", col_names = headers,skip = 6)

colloquium_clean <- colloquium |>
  filter(!apply(colloquium == "NA", 1, all)) |>
  select(-contains("RecipientLastName")) |>
  select(-contains("RecipientFirstName")) |>
  select(-contains("RecipientEmail")) |>
  rename("Comments" = "Q12") |>
  rename("Student's Track" = "Q4") |>
  rename("Year" = "Q5") |>
  rename("Are_You" = "Q6") |> 
  rename("Presentation_Score" = "Q11")|>
  pivot_longer(
    cols = starts_with("Q"), 
    names_to = "questions", 
    values_to = "score",
    values_drop_na = TRUE
  )
```

## Q3b

Finally, calculate this student’s average score for each of questions
7-10.

``` r
average_score <- colloquium_clean |>
  group_by(questions) |>
  summarise(mean = mean(score)) |>
  filter(questions == "Q7"|questions == "Q8"|questions == "Q9"|questions == "Q10")
```

## Important note about file paths in Quarto documents

When you render a Quarto document, RStudio spins up a new instance of R,
which is separate from the instance of R that you cna interact with. The
working directory for this instance of R is whatever directory your
Quarto document is saved in.

If your quarto document is saved in the same directory as your RStudio
project (e.g., `MICR_475`), then there is no difference between your
interactive working directory and the working directory for your Quarto
document.

However, if your homeworks are saved in a `HMK` directory, then the
Quarto working directory will be `HMK`. To access the saved `.csv` file,
`read_csv()` will need to look *up* one directory and then go back
*down* into `HMK`. `..` means “up one directory”, so you would need to
use `read_csv("../colloquium_assessment.csv")` instead of
`read_csv("colloquium_assessment.csv")`.
