SELECT w1.id
FROM Weather w1, Weather w2
WHERE DATEDIFF(w1.recordDate, w2.recordDate) = 1 AND w1.temperature > w2.temperature;

/*
Using duplicate of tables and join cross. Datediff used for difference between two dates. If you don't use join and instead 
math normally such as 2011-12-31 + 1, sql calculated 2011-12-32, which could lead to wrong values.
*/
