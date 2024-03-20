
## January

[[2024-01-19]] Setup Obsidian and Git. Relocated my study contents. Checked leetcode problem that I was wrong. [[2024-01-19]]

01-20 Solved Leetcode join problems

[[2024-01-27]] Proveed with Growth Hacking Up to Acquisition. [[Growth Hacking_1 PMF to Acquisition]]
Practiced Leetcode problems [Monthly Transactions](https://github.com/NeoSeo/Obsidian/blob/2200e8b86a489dd49589cc70a5c3038b31ac8780/SQL/pivot_example_2.sql)
Studying group by part using case when in Inflearn

[[2024-01-29]] Learnt rollup and cube clause with group by

## February

[[2024-02-04]] Closed acquisition part in growth hacking, we need to specify ROAS window range for each channel to measure effects
Learnt analytics of SQL. rank(), dense_rank, row_number() over (partition by ~ order by), but window function isn't required. Attend also **nulls last** clause to processs null in ranks
Window functions are used in arregation function like max(),min(),sum(),avg(),count()
We use window function such as rows between unbounded preceding and current row (or range unbounded preceding and current row)

[[2024-02-05]] Solved aggregation problems and learnt. Learnt difference of rows and range and moving average using window function

[[2024-02-08]] Learnt activation part in growth hacking that importance of cohort in funnel.
Learnt lead(), lag(), first_value(), last_value() and other analytic clause of SQL
Be cautiou when you use range or rows as window. row with aggregation consider each same value each, but range not (ex 5000 + 9/1 1000 + 9/2 1000(order by month) = 5000 -> 6000 -> 7000 using ROWS, but for RANGE 5000 -> 7000 -> 7000)

[[2024-02-11]] Learnt retention part in growth hacking that classic retention and range retention and its pros and cons. Cohort is also important to measure retention rate. (period, events etc)

[[2024-02-14]] Learnt percentile_disc(0.5) within group (order by sal)

[[2024-02-15]] Learnt correlation query and non-correlation queries using in or exists. In this case, subqueries are offering unique values to main queries, **NOT changing the level of sets of main queries **  

[[2024-02-17]] Learnt python condition prose

[[2024-02-22]] Practiced retention, expected revenue, conversion rate
Chekced NOT in and NOT exists difference when NULL value exists in subquery

## March

[[2024-03-15]] Implemented retention_rate, ARPPU of Excel tables into SQL format. 
**(Acclaimed by tutors!) 👏

[[2024-03-16]] Solved 3 intermediate leetcode problems

[[2024-03-20]] Solved 2 intermediate leetcode problems, Learnt correct raw data for analysis(Garbage in garbage out), Mean value could be distorted by outliers (Predators in dating app), crack the raw data at lower level raw data, be away from vanity metrics

