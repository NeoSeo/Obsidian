
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

def func(a):
    b= a+1
    return a,b
func(2)
# -> (a,b) 튜퓰 형태의 복수 값 반화. 원래 함수는 하나의 값만 반환하지만, 파이썬만의 특징!!(튜플의 성질 이용)

```

sort() [순서대로 정렬]와 reverse() [역순으로 정렬], append()는 본래의 리스트 값이 바뀌지만 split()처럼 보통 이런 내장함수는 본래 함수가 바뀌지 않는다 -> 다른 변수에 넣어줘야 한다.

## 데이터 타입

#### list: list() or []
#### tuple: tuple()
a = (1,2,3) :선언 후 읽기만 가능하고 추가,삭제 등의 추가는 불가능하다. 튜플 간의 덧셈으로 add 하거 (1,2)*2 = (1,2,1,2) 씩의 곱셈 가능하다. x, y = y, x씩으로  서로 변수값 바꿈도 튜플 성질 때문에 가능하다.
list 와 튜플은 서로 데이타 타입이 변환 가능하다.

#### dictionary: dict() or {}
```python
data = {'한국': '서울', '일본': '도쿄'} 
data['한국'] ## 서울 출력
data['미국'] = '워싱턴' ## 인자 추가
del data['일본'] ## 일본 삭제
data['미국'] = '시애틀' ## 워싱턴에서 시애틀로 바꿈
data.keys() ## key 값만 출력
data.keys() ## 키값만 리스트로 출력
data.values() ## 밸류값만 출력
```

key 값은 못 바꾼다