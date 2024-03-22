
```python
a.find('dd') ## dd의 인덱스. indexing 'dd'
b = a.split(",") ## ,을 기준으로 나눠서 b에 리스트 형태로 저장
a.strip()
a.strip('dd') ## Space 혹은 dd같은 문자 삭제 removing space or particular str
print("This is a {}".format("pen"))
format(interest, ".2f") ## 소숫점 둘째자리까지


code = '000660\n00000102\t12312312' ## \n 코드 줄바꿈 \t tab 역할
print (code)

## for + list
show = []
num_list = [0, -11, 31, 22, -11, 33, -44, -55]
for i in num_list:
    if i > 0:
        show.append(i)
        print(show) ## 
print(show)

[31] 
[31, 22]
[31, 22, 33]
[31, 22, 33] ## for문 밖 최종 print값

data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
data.reverse() ## 리스트를 역순으로 저장


```

sort() [순서대로 정렬]와 reverse() [역순으로 정렬] 만 본래의 리스트 값이 바뀌지만 split()처럼 보통 이런 내장함수는 본래 함수가 바뀌지 않는다



