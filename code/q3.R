#Q3 -- Identify the five programming language tags with the highest total number of questions asked between 2015 and 2020 (inclusive)

Q3_data <- data %>%
  filter(year > 2014) %>%
  group_by(tag) %>%
  summarize(total_Qs = sum(num_questions)) %>%
  arrange(desc(total_Qs)) %>%
  #only select 5 most popular tags
  head(n=5) %>%
  #reorder based on 'total_Qs' (for plot later)
  mutate(tag = reorder(tag, total_Qs))

highest_tags <- Q3_data$tag
highest_tags
  #OUTPUT: ["javascript", "python", "java", "android", "c#"]

#make a plot
q3_plot_I <- ggplot(data=Q3_data, aes(y=tag, x=total_Qs)) + 
  geom_col() +
  labs(title="Languages with Most Questions - 2015-2020", x="# Questions", y='Programming Language') +
  theme(plot.title=element_text(size=11),
        axis.title.x = element_text(size=9), axis.title.y = element_text(size=9),
        axis.text.x = element_text(size=8), axis.text.y = element_text(size=8))
q3_plot_I