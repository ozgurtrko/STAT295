library(ggplot2)
library(palmerpenguins)
head(penguins)
str(penguins)

## ii. Which species category has the highest frequency?

ggplot(penguins, aes(x = species)) + geom_bar()

##  Calculate number of cases in each color category.Modify the plot for better visualizations. 
##  Change the bar fill and border colors, plot labels, and 
##  title by adding options to the geom_bar function.

library(dplyr)
q3 <- penguins %>% 
  count(species) 
q3


ggplot(q3, aes(x = reorder(species, -n),
               y = n)) + 
  geom_bar(stat = "identity") +
  labs(x = "Species",
       y = "Frequency",
       title = "Number of penguins for each species")


## iv. Change colors of the plot you created in part iii.

ggplot(q3, 
       aes(x = reorder(species, -n),
           y = n)) + 
  geom_bar(stat = "identity",
           fill = "blue", 
           color = "yellow") +
  geom_text(aes(label = n),
            vjust = -0.4) +
  labs(x = "Species",
            y = "Frequency",
            title = "Number of penguins for each species")


## vi. Indicate the distribution of the bill length.

ggplot(penguins, aes(x = bill_length_mm)) +
  geom_histogram(color = "black", fill = "salmon")

## vii. Add a mean line for the histogram.

ggplot(penguins, aes(x = bill_length_mm)) +
  geom_histogram(color = "black", fill = "salmon") +
  
  #add a mean line
  geom_vline(aes(xintercept = mean(penguins$bill_length_mm, na.rm = T)),
             color = "blue", linetype = "dashed", size = 2) +
  labs(x = "Bill Length",
       y = "Frequency",
       title = "Histogram of Penguin Bill Lengths with Mean Line")



## viii. Add a density plot on the histogram.


ggplot(penguins, aes(x = bill_length_mm)) +
  geom_histogram(aes(y = ..density..), color = "black", fill = "salmon") +
  geom_density(alpha = .2, fill = "lightsteelblue2")


### Question 2: Bivariate Graphs

## i. Create a plot by examining the species and island relationships.

ggplot(penguins, 
       aes(x = species, fill = island)) +
  geom_bar(position = "stack")


## ii. Change the position in the same chart type.

ggplot(penguins, 
       aes(x = species, fill = island)) +
  geom_bar(position = "dodge")

#More
ggplot(penguins,
       aes(x = species,
           fill = island)) +
  geom_bar(position = position_dodge(preserve = "single"))


## iii. Create a segmented bar plot that each bar represents the 100 percent.


ggplot(penguins,
       aes(x = species,
           fill = island)) +
  geom_bar(position = "fill") +
  labs(y = "Proportion")

## iv. Change the levels of these variables and colors.


ggplot(penguins,
       aes(x = factor(species,
                      levels = c("Adelie", "Chinstrap", "Gentoo")),
           fill = factor(island,
                         levels = c("Biscoe", "Dream", "Torgersen")))) +
  geom_bar(position = "fill") +
  scale_fill_brewer(palette = "Set2") +
  labs(y = "Percent",
       fill = "Island",
       x = "Class",
       title = "Penguins Island by Species") +
  theme_minimal()

## v. Add a percentage for each variables.

q5 <- penguins %>% 
  group_by(species, island) %>% 
  summarize(n = n()) %>% 
  mutate(pct= n/sum(n),
         lbl = scales::percent(pct))
q5  

ggplot(q5,
       aes(x = factor(species,
                      levels = c("Adelie", "Chinstrap", "Gentoo")),
           y = pct,
           fill = factor(island,
                         levels = c("Biscoe", "Dream", "Torgersen")))) +
  geom_bar(stat = "identity", position = "fill") +
  geom_text(aes(label = lbl),
            position = position_stack(vjust =0.5), size = 4) +
  scale_fill_brewer(palette = "Set2") +
  labs(y = "Percent",
       fill = "Island",
       x = "Penguins Species",
       title = "Penguins Island by Species") +
  theme_minimal()





### Question 3: Quantitative Data


## i. Please read the data and take sample consists of 500 observations.

set.seed(16)
student <- read.csv("https://raw.githubusercontent.com/shriyaa01/Student-Result-Analysis/main/Expanded_data_with_more_features.csv")

student <- student[sample(nrow(student), 500, replace = F),]

## ii. Add a fitting line to the plot.

ggplot(student,
       aes(MathScore,
           y = ReadingScore)) +
  geom_point(color = "purple",
             size = 2, 
             alpha = .8) +
  scale_y_continuous(limits = c(0, 100)) +
  scale_x_continuous(breaks = seq(0, 100, 10),
                     limits = c(20, 100)) +
  labs(x = "Math Score",
       y = "Reading Score",
       title = "Student Math Score - Reading Scrore")


ggplot(student, 
       aes(x = MathScore,
           y = ReadingScore)) +
  geom_point(color = "blue") +
  geom_smooth(color = "red")


## iii. What is the relationship between Maths Score and Reading Score 
## bases on a Gender and EthnicGroup (use facet_wrap)?

# Facet_wrap reproduces a graph for each level a given variable (or combination of variables). 
# Facets are created using functions that start with facet_wrap()

ggplot(student,
       aes(x = MathScore, 
           y = ReadingScore,
           color = Gender)) +
  geom_point(size = 2,
             alpha = .4) +
  geom_smooth(method = "lm",
              se = F) +
  scale_y_continuous(limits = c(25, 100)) +
  scale_x_continuous(breaks = seq(0, 100, 25),
                     limits = c(25,100)) +
  scale_color_manual(values = c("skyblue2",
                                "brown2")) +
  facet_wrap(~EthnicGroup)

## iv. For the plot in part iii, add a name for each axis and add a theme.

ggplot(student,
       aes(x = MathScore, 
           y = ReadingScore,
           color = Gender)) +
  geom_point(size = 2,
             alpha = .4) +
  geom_smooth(method = "lm",
              se = F) +
  scale_y_continuous(limits = c(25, 100)) +
  scale_x_continuous(breaks = seq(0, 100, 25),
                     limits = c(25,100)) +
  scale_color_manual(values = c("skyblue2",
                                "brown2")) +
  facet_wrap(~EthnicGroup) +
  labs(title = "Relationship between Students' Math and Reading Score by Genfer and Ethnicity",
       subtitle = "Sample is used for this graph",
       caption = "source: https://www.kaggle.com/datasets/desalegngeb/students-exam-scores",
       x = "Mathematic Scores",
       y = "Reading Score",
       color = "Gender") +
  theme_light()


### Grouped Kernel Density

## v. What is the distributions of price based on a cut type?


ggplot(diamonds,
       aes(x = price,
           fill = cut)) +
  geom_density(alpha = 0.4) +
  labs(title = "Diamonds Price Distr. by Cut Type")+
  theme_light()



## vi. Please show those distributions in different scales.


ggplot(diamonds,
       aes(x = price,
           fill = cut)) +
  geom_density(alpha = 0.4, adjust = 1.5) +
  facet_wrap(~cut) +
  theme(
    legend.position = "none",
    panel.spacing = unit(0.1, "lines"),
    axis.ticks.x = element_blank()
  )


### Ridgeline plots

install.packages("ggridges")
library(ggridges)

## vii. Please read data from the link. After reading data find the DMC (The Duff Moisture Code (DMC) 
## represents fuel moisture of decomposed organic material underneath the litter) for each day by using ridgeline plots. 

data <- read.csv("https://raw.githubusercontent.com/jasp9559/Forest-Fire-ANN-Python-R/main/fireforests.csv")
head(data)

data$day <- factor(data$day,
                   levels = rev(c("sun","mon","tue","wed","thu","fri","sat")))
head(data)


ggplot(data,
        aes(x = DMC,
            y = day,
            fill = day)) +
  geom_density_ridges() +
  theme_ridges() +
  theme(legend.position = "none")


### Question 4: Box Plots

## i. Use the student data in Question 3. 
## Examine MathScore of students based on the gender by using box plot.

library(ggthemes)
q4 <- ggplot(student,
             aes(x = Gender,
                 y = MathScore)) +
  geom_boxplot() +
  xlab("Gender") +
  ylab("MathScore") +
  ggtitle("Math Score of Students by Gender")

q4 + geom_boxplot(fill = c("#00AFBB", "#E7B800"), color = "#FC4E07") +
  theme_wsj()



## ii. In this time, examine Reading Score and Gender. 
## Also, add each points on the box plot and add theme.


q5 <- ggplot(student,
             aes(x = Gender,
                 y = ReadingScore)) +
  geom_boxplot(size = 1,
               outlier.shape = 1,
               outlier.color = "darkblue",
               outlier.size = 3) +
  geom_jitter(alpha = 0.5,
              width = .2) +
  xlab("Gender") +
  ylab("Reading Score") +
  ggtitle("Reading Score of Students by Gender")

q5 + geom_boxplot(fill = c("#00AFBB", "#E7B800"), color = ("#FC4E07")) +
  theme_wsj(color = "white")


### Violin plots

## iii. Use penguins data in this part and 
## examine the species and body mass of penguins based on a violin plots.

ggplot(penguins, aes(x = species,
                     y = body_mass_g)) +
  geom_violin(fill = "darkred") +
  geom_boxplot(width = .2,
               fill = "turquoise2",
               outlier.color = "turquoise2",
               outlier.size = 2) +
  labs(title = "Body mass distb. of penguis by species")

### Strip Plot

## iv. What is the relationship between species and body mass, apply strip plot 
## and indicate relation.


ggplot(penguins,
       aes(x = species,
           y = body_mass_g)) +
  geom_point() +
  labs(title = "Body mass dist. of penguins by species")

## v. Use the geom_jitter function to understand point distributions better.


ggplot(penguins,
       aes(x = species,
           y = body_mass_g)) +
  geom_jitter() +
  labs(title = "Body mass dist. of penguins by species")

## vi. Add a color for each species.

library(scales)
ggplot(penguins,
       aes(y = factor(species, 
                      labels = c("Adelie",
                                 "Chinstrap",
                                 "Gentoo")),
           x = body_mass_g,
           color = species)) +
  geom_jitter(alpha = 0.8,
              size = 1.5) +
  labs(title = "Penguins Body Mass based on species",
       x = "Body Mass",
       y = "Species",
       subtitle = "Penguins data set") +
  theme_minimal() +
  theme(legend.position = "none")











