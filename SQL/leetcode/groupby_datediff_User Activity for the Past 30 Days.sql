/*
Table: Activity

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+
This table may have duplicate rows.
The activity_type column is an ENUM (category) of type ('open_session', 'end_session', 'scroll_down', 'send_message').
The table shows the user activities for a social media website. 
Note that each session belongs to exactly one user.
*/

select activity_date as day, count(distinct user_id) as active_users
from Activity
where activity_date between DATE_SUB('2019-07-27', INTERVAL 29 DAY) and '2019-07-27'
-- or DATEDIFF('2019-07-27', activity_date) and '2019-07-27'
group by activity_date
