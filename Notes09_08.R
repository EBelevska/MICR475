# You need to load a project everytime that you open R studio. 
library(tidyverse)
## You only need to install a package once.
install.packages("palmerpenguins")

# In order to view the data use the following code
penguins # same as print(penguins)
glimpse(penguins) # This is often the best one!
str(penguins) # stands for structure
view(penguins)

# penguins is a tibble (basically a data frame)

# using ggplot() will open up a blank plot. 
## In order to have something in the plot use the following code
### using geom_point will make the data into a dot plot
ggplot(data = penguins,
   mapping = aes(x=flipper_length_mm, y=body_mass_g, color = island)) +
  geom_point(aes(color = island)) + 
geom_smooth(method = "lm")