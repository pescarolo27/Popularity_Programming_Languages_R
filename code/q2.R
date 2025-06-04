#Q2 -- What was the percentage of R questions for 2020?

r_percentage <- filter(r_over_time, year == 2020)$percentage
r_percentage
  #OUTPUT: 0.9658242 (%)