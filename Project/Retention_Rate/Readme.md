[Retention/Revenue 분석하기](https://www.inflearn.com/course/%EA%B7%B8%EB%A1%9C%EC%8A%A4%ED%95%B4%ED%82%B9-%EB%8D%B0%EC%9D%B4%ED%84%B0-%EC%8B%A4%ED%97%98-%EC%84%B1%EC%9E%A5-%EC%84%9C%EB%B9%84%EC%8A%A4/dashboard)

# Introduction
Retention rate 및 Revenue 분석은 AARRR을 이루는 중요한 구성 중 하나이다. 강의에서는 엑셀로만 Retention rate 및 Revenue 분석을 구했지만 여기서는 좀 더 나아가 SQL을 사용하여 둘을 구하는 Query를 작성해본다. 시각화는 sql의 영역이 아니기 때문에 추후 다른 곳에서 다시 해본다.
The Retention Rate and Revenue analysis are key components of the AARRR framework. In the lecture, we only analyzed the Retention Rate and Revenue using Excel, but here we'll take a step further by writing queries to calculate both using SQL. Visualization is not within the domain of SQL, so we will revisit it in a different context later.

# File contents
## Retention&ARPPU_for_SQL.xlsx:
강의에서 다루었던 retention rate 및 ARPPU 실습 결과 엑셀 테이블이다. 거기에 더해 SQL용 테이블로 만들기 위한 raw data+수식도 포함되어 있다. 하이라이트 된 탭을 참고하면 된다.
There's a table of practice results for retention rate and ARPPU covered in the lecture. In addition, it includes raw data and formulas for creating a table for SQL use. You should refer to the highlighted tab.
## creating_table_for_signup:
강의에서 사용한 signup raw table을 만드는 작업을 한다. Creating the signup raw table used in the lecture.
## creating_table_for_payment:
강의에서 사용한 payment raw table을 만다는 작업을 한다.
Creating the payment raw table used in the lecture.
**위 두 sql을 반드시 실행시키고 아래 쿼리를 실행해야 한다.
**The above two SQL commands must be executed before running the following queries.
## Retention_rate
Retention rate 계산하기 Calculate Retention rate
## Revenue_analysis
결제율, ARPPU 등 구하기 Calculate payment rate, ARPPU, etc.
