# Pewlett-Hackard-Analysis

## Overview of Analysis

There were multiple purposes for this analysis which I will outline below:
1. The first was to create a table for employees who were eligible for retirement and contained the following information: employee number, first & last names, titles, from dates and to dates (of employment). This table was named retirement_titles.
2. From the retirement_titles table we filtered out employees who have already left and and sorted it by the by the last date of the most recent title. This table was named unique_titles.
3. From the unique_titles table we retrieved the number of titles which were then sorted in descending order (from the highest number of employees of a given title, to the least). 
4. We then looked for employees who were eligible for a mentoship program in order to fill the future vacancies of the retiring titles found above. To do that, we created a table which joined our initial employees, dept_emp, and titles. This table was then filtered by a birthdate of those born in 1965 and then ordered by the employees' respective employee numbers.


## Results

There are four major points from the analysis above:
* The retirement_titles table does not account for employees who have already left the company
* Senior Engineers and Senior Staff make up over 70% of retiring titles
* Other titles make up less than 30%
* Some of those eligible for the mentorship program already hold do not hold senior titles

## Summary

From the retiring_titles table, we can see that by adding up all titles there are 72,458 positions that will need to be filled. 
In order to determine whether there are enough qualified we would need to run a separate query on the mentorship_eligibility table, that would count the number of eligible employees that hold each title. 
