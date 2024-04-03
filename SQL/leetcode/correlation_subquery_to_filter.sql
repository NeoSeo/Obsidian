-- 1st solution
SELECT ROUND(SUM(TIV_2016),2) AS TIV_2016 FROM Insurance a
WHERE EXISTS (SELECT * FROM Insurance WHERE PID <> a.PID AND TIV_2015 = a.TIV_2015) -- CORRELATION SUB-QUERY
AND NOT EXISTS (SELECT * FROM Insurance WHERE PID <> a.PID AND (LAT,LON) = (a.LAT,a.LON));

-- 2nd solution
SELECT ROUND(SUM(TIV_2016),2) AS TIV_2016
FROM
(SELECT *,
COUNT(*) OVER(PARTITION BY TIV_2015) AS CNT1,
COUNT(*) OVER(PARTITION BY LAT, LON) AS CNT2
FROM INSURANCE
) AS TBL
WHERE CNT1 >= 2 AND CNT2 = 1

-- 3rd soltion
with t1 as (
select pid, tiv_2015, tiv_2016, concat(lat, lon) as loc
from Insurance
group by concat(lat, lon)
having count(*) < 2
)
select round(sum(i.tiv_2016),2) as tiv_2016 from Insurance i, t1
where i.tiv_2015 in (select tiv_2015 from Insurance group by tiv_2015 having count(*) >= 2)
and t1.pid = i.pid

/*
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+-------------+-------+
pid is the primary key (column with unique values) for this table.
Each row of this table contains information about one policy where:
pid is the policyholder's policy ID.
tiv_2015 is the total investment value in 2015 and tiv_2016 is the total investment value in 2016.
lat is the latitude of the policy holder's city. It's guaranteed that lat is not NULL.
lon is the longitude of the policy holder's city. It's guaranteed that lon is not NULL.
 

Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
Round tiv_2016 to two decimal places.

The result format is in the following example.

 

Example 1:

Input: 
Insurance table:
+-----+----------+----------+-----+-----+
| pid | tiv_2015 | tiv_2016 | lat | lon |
+-----+----------+----------+-----+-----+
| 1   | 10       | 5        | 10  | 10  |
| 2   | 20       | 20       | 20  | 20  |
| 3   | 10       | 30       | 20  | 20  |
| 4   | 10       | 40       | 40  | 40  |
+-----+----------+----------+-----+-----+
Output: 
+----------+
| tiv_2016 |
+----------+
| 45.00    |
+----------+
*/
