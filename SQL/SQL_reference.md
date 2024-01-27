# SQL reference
---

```sql
select year||'&'||month -- concat
select concat(year(trans_date),'-',month(trans_date))
where a in (' ', ' ') -- 특정 문자 조건 condition for particular string

select length 
select char_length -- 바이트 혹은 그 자체의 글자수 처리 counting the number of letter

select sum(if(c.action="confirmed",1,0)) -- pivot using if clause
where datediff(date1, date2)=1 -- 날짜 차이가 1, math date difference

/* 날짜 예문 date examples
date yyyy-mm-dd
timestamp yyyy-mm-dd hh:mm:ss
time hh24:mm:ss
interval
*/
to_date('2022-03-11','yyyy-mm-dd') -- 문자열을 날짜형으로 바꾸기 str to date type
to_timestamp('2022-03-11','yyyy-mm-dd hh24:mi:ss') -- 날짜및시간형으로 바꾸기 str to date&time
to_char(hiredate, 'yyyy-mm-dd') -- 날짜를 string type으로 변환 date to str type
to_date('2022-03-11','yyyy-mm-dd')::text -- 문자열로 바꿔줌 str to date, again date to str

pg_typeof() -- 타입을 나타내줌 show variables type
hiredate::timestamp -- ::을 활용한 빠른 변환 quick transform
extract(year from hiredate) -- 연도 추출. worse syntax
date_part('year', hiredate) -- 연도 추출. better clause than extract

select to_date('2024-03-11', 'yyyy-mm-dd') + 2 -- 2일 더하기 add 2 days
select to_timestamp('2024-02-11 13:24:35', 'yyyy-mm-dd hh24:mi:ss') + interval'10hour' -- 10시간 더하기 add 10 hours
-- '2day 3hour 30minute' 이렇게 일, 시간, 분도 가능 
-- to_date형에도 interval로 더하면 timestamp형이 됨. to_date to be timestamp type when added by interval clause

now() -- show current_timestamp
current_date, current_time -- () 없음. showing current date/time
date_trunc('second' now()) -- 초 단위 자르기, cut by second unit
trunc(99.9999, 2) -- == 99.99
justify_interval(duration) -- 한달을 무조건 30일로 계산, counting a month firmly 30 days
age() -- 한달을 28, 31일등 정확히 계산, counting actual days within month

avg(str)
sum(str) -- 문자열은 불가 aggregate 불가
min(str)
max(str) -- group by랑 쓸 경우 아무 str이나 가져와야 할 때 max/min을 쓴다
min(date)
max(date) -- min/max는 문자열/날짜 가능. 날짜의 경우 max는 가장 최근 날짜


```

[[데이터분석_SQL_Fundamentals.pdf]]

