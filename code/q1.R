#load in libraries
library(tidyverse)
library(dplyr)
library(readr)
library(ggplot2)
library(stringr)

#import the data
data <- read_csv("stack_overflow_data.csv")
data
  #420,066 observations, 4 variables

#Q1 -- What percentage of questions are tagged with r per year?
r_over_time <- data %>%
  filter(tag == "r") %>%
  mutate(percentage = 100*(num_questions/year_total))

r_over_time
  #13 observations, 5 variables

#make a plot
q1_plot_I <- ggplot(data=r_over_time, aes(x=year, y=percentage)) +
  geom_line() + geom_point() +
  labs(title="Annual Percentage of Stack Overflow Questions Tagged with R", 
       x="Year",y="% Questions") +
  scale_x_continuous(breaks=c(2007:2020)) +
  theme(axis.text.x = element_text(size=7, angle=15),
        axis.text.y = element_text(size=8),
        plot.title = element_text(size=11),
        axis.title.x = element_text(size=9), axis.title.y = element_text(size=9))
q1_plot_I
