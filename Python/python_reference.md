

```python

b = a.split(",") ## ,을 기준으로 나눠서 b에 리스트 형태로 저장
a.strip() #앞뒤 공백 다 지우기, lstrip, rstrip이 친척으로 있다
a.strip('dd') ## Space 혹은 dd같은 문자 삭제 removing space or particular str
print("This is a {}".format("pen"))
format(interest, ".2f") ## 소숫점 둘째자리까지
a.count('df') # df 가 몇번 들어갔는지 카운팅
strs = 'Course cork'
strs.index('C') # 결과는 0, 맨 왼쪽에서부터 위치 알려주는 메서드
a.find('dd') ## dd의 인덱스. indexing 'dd'  인덱스 대신 쓸수 있음, 만약 찾는 값이 ㅇ없으면 -1 반환
a.lower() #소문자
a.upper() #대문자
string = "David goes to Korea"
string.replace("David", "Dave") # david를 dave로 바꾸기 


# 문자 집어넣기
strs = 'Call me by your name'
dot = '.'
dot.join(strs) # C.a.l.l. .m.e. .b...............

# 12345를 리스트로 만들어보기
string = "12345"
comma = ','
d= comma.join(string)     # 껴넣을 문자.join(문자열)
print(d)
e = d.split(',') # [1,2,3,4,5]




## range와 reverse 이용
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for i in range(9,-1,-1):
    print(data[i])
## 위와 같은 결과값을 반환
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
data.reverse()
for item in data:
    print (item)
## -> [10,9,8,7,6,5,4,3,2,1]


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
# -> (a,b) 튜퓰 형태의 복수 값 반화. 원래 함수는 하나의 값만 반환하지만, 파이썬만의 특징!!(튜플의 성질 이용) 마찬가지로 아래도 가능
var1, var2 = 3, 4 ## (var1, var2)형태의 튜플로 생각하여 3,4를 각각 입력한다

Range(1, 11, 2) # odd numbers only  


```

sort() [순서대로 정렬]와 reverse() [역순으로 정렬], append()는 본래의 리스트 값이 바뀌지만 split()처럼 보통 이런 내장함수는 본래 함수가 바뀌지 않는다 -> 다른 변수에 넣어줘야 한다.

## Data type

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

data = {'company': ['회사','O']} ## 이런식의 리스트 형의 value도 가능하다.

if english in data.keys(): 
    data[english][1] = 'O' ## data 딕셔너리의 englsih변수 값과 같은 key값의 2번째 value를 'O'로 바꿔줌
    
```

key 값은 못 바꾼다

#### set: set() or {} -> 보통은 dict로 검색되기 때문에 set()이 낫다
집합 내에서 순서와 중복이 없다 
```python
data_set = {'apple', 'dell', 'samsung', 'LG'}
'motor' in data_set ## >> False

data1 & data2 # 교집합
data1 | data2 # 합집합
data1 - data2 # 차집합
data1 ^ data2 # 여집합

data_set = ['apple', 'dell', 'samsung', 'LG', 'apple', 'dell', 'samsung', 'LG']
## 리스트에 중복이 있어서 삭제하고 싶을 때 set으로 타입을 바꾸고 다시 list로 바꾸면 중복이 삭제

number_list2 = {1, 2, 3}
number_list2.add(4) # 하나의 데이터를 추가할 때는 add
number_list2.update([5, 6]) # 여러 데이터를 추가할 때는 리스트 형태로 update 함수를 사용
number_list2.remove(2) # 특정 데이터를 삭제할 때는 remove

```

## Crawling

[크롤링](Python/crawling_1.py)
``` python
import requests
from bs4 import BeautifulSoup
res = requests.get('https://www.daum.net/', verify = False)
html = res.text

soup = BeautifulSoup(html, 'html.parser') #res.text 를 쓴 경우
soup = BeautifulSoup(res.content, 'html.parser') # res.text를 안 썼을 시

soup = BeautifulSoup(res.content,'html.parser')
mydat = soup.find('title')
mydat.get_text() ## 다음
# or
mydat.string
# or
mydat.text
mydat.attrs['href'] #링크 가져오기



from bs4 import BeautifulSoup
html = """
<html> 
        <body> 
            <h1 id='title'>[1]크롤링이란?</h1> 
            <p class='cssstyle'>웹페이지에서 필요한 데이터를 추출하는 것</p> 
            <p id='body' align='center'>파이썬을 중심으로 다양한 웹크롤링 기술 발달</p> 
        </body> 
</html>
"""
soup = BeautifulSoup(html,"html.parser")

# 태그로 검색 방법

data = soup.find('p', class_ = 'cssstyle')
data1 = soup.find('p', 'cssstyle')
data2 = soup.find('p', attrs={'align':'center', 'id': 'body'})
data3 = soup.find(id = 'body')
data4 = soup.find_all('p') ## 모든 p값을 가져옮
print(data) ## tag 나 각종 설정 다 보임
print(data1.string)
print(data2.get_text())
print(data3)

for i in data4:
    print(i.get_text())

select('div.course#python > #crawling') #  select는 find_all 대신 사용. div, class는 course id는 파이썬이고 '바로 그 아래' id가 crawling인 영역을 크롤링


##Select 사용
## select로 뽑을 경우 리스트 형태 select_one으로 뽑으로 경우 object 타입이 반환

from bs4 import BeautifulSoup
import requests
res = requests.get('https://davelee-fun.github.io/blog/crawl_html_css.html')
html = res.text ## res에 저장된 것들을 text형식으로 보여준다


soup = BeautifulSoup(html, 'html.parser') #res.text 를 쓴 경우
soup = BeautifulSoup(res.content, 'html.parser') # res.text를 안 썼을 시
items = soup.select('tr') ## select 대신 find_all을 써도 된다.
for i in items:
    cols = i.select('td')
    row_str = ''
    for col in cols:
        row_str += '.. '+col.get_text()
    print(row_str[2:])

## 오류 여부 검사
res.status_code != 200 ## 페이지 상태, 오류여부는 status_code로

##urllib library를이용한 크롤링
from urllib.request import urlopen ## <- 이 부분과
from bs4 import BeautifulSoup

res = urlopen('https://davelee-fun.github.io/') ## <-- 이 부분만 다름
soup = BeautifulSoup(res, 'html.parser')

data = soup.select('h4.card-text')
for item in data:
    print (item.get_text().strip()) ## strip은 불필요한 띄어쓰기 없애기

## 여러 페이지 크롤링 추가
# 1
for page_num in range(3):
    if page_num == 0:
        res = requests.get('https://davelee-fun.github.io/') # 1 page가 보통 숫자 페이지로 되어 있지 않기 때문
    else:
        res = requests.get('https://davelee-fun.github.io/page' + str(page_num + 1))

# 2
import requests
from bs4 import BeautifulSoup
for page_num in range(2):
        res = requests.get(f'https://startcoding.pythonanywhere.com/basic?page={page_num}'+'&keyword=') # &keyword=는 지워줘도 된다
        soup = BeautifulSoup(res.content, 'html.parser')
        items = soup.select('div.product')
        for i in items:
            category = i.select_one('p.product-category').get_text()
            name = i.select_one('h3.product-name').get_text()
            price = i.select_one('h4.product-price').get_text().strip().split('원')[0]
            print(category, name, price)


```


## Excel

``` python


## !pip install openpyxl 인스톨

import requests, openpyxl
from bs4 import BeautifulSoup
from openpyxl.styles import Font ## 폰트 라이브러리
from openpyxl.styles import Alignment ## 정렬, 줄바꿈







## 엑셀 파일 열고 만들기
# 엑셀 파일 열기
work_book = openpyxl.load_workbook('train.xlsx') 
for each_row in work_sheet.rows: 
    print (each_row[3].value)
    
work_book.close()
# 새 시트 열기
new_sheet = excel_file.create_sheet(title='New Sheet')


# 폰트 바꾸기
font = Font(bold=True, color='FF0000', underline='single')
cell.font = font
alignment = Alignment(wrap_text=True)
cell.alignment = alignment


# 본격적으로 작업
excel_file = openpyxl.Workbook()
excel_sheet = excel_file.active

excel_sheet.title = 'MYSITE게시글제목'

worksheet.append(['Value 1', 'Value 2', 'Value 3']) ## 데이타 넣기
worksheet.column_dimensions['A'].width = 20 ## 너비 설정
cell.hyperlink = 'https://example.com' ## 셀에 하이퍼 링크 넣기

excel_file.save('MYSITE.xlsx')
excel_file.close()


# 함수로 활용
def write_xl(filename, sheetname, listdata):
    xl_file = openpyxl.Workbook()
    xl_sheet = xl_file.active
    xl_sheet.column_dimensions['A'].width = 100
    xl_sheet.column_dimensions['B'].width = 20
    
    if sheetname != '':
        xl_sheet.title = sheetname
        
    for data in listdata:
        xl_sheet.append(data)
    xl_file.save(filename)
    xl_file.close()

```

## Crawling -> Excel

``` python

## Pandas 이용
import requests
from bs4 import BeautifulSoup
import pandas as pd

data = []
for page_num in range(1,3):
        res = requests.get(f'https://startcoding.pythonanywhere.com/basic?page={page_num}'+'&keyword=') # &keyword=는 지워줘도 된다
        soup = BeautifulSoup(res.content, 'html.parser')
        items = soup.select('div.product')
        for i in items:
            category = i.select_one('p.product-category').get_text()
            name = i.select_one('h3.product-name').get_text()
            price = i.select_one('h4.product-price').get_text().strip().split('원')[0].replace(',','')
            data.append([category,name,price])
        
        
df = pd.DataFrame(data, columns = ['카테고리','상품명','가격'])
df.to_excel('result.xlsx', index = False)





# 1

import requests, openpyxl
from bs4 import BeautifulSoup
from openpyxl.styles import Alignment, Font

excel_file = openpyxl.Workbook()
excel_sheet = excel_file.active
excel_sheet.title = 'crawl'
header = ['No', '게시글제목', '댓글']
excel_sheet.append(header)
excel_sheet.column_dimensions['A'].width = 20
excel_sheet.column_dimensions['B'].width = 80
excel_sheet.column_dimensions['C'].width = 80

res = requests.get('https://davelee-fun.github.io/trial/board/news.html')
soup = BeautifulSoup(res.content, 'html.parser')
contents = soup.select('div.list_title')


for index, i in enumerate(contents): ## 인덱스 넣기
    if index <= 3: ## 2번째 게시글까지만 가져오기
        title = i.select_one('span.subject_fixed')
        repl = i.select_one('span.rSymph05')
        link = i.select_one('a.list_subject')
        rest = requests.get('https://davelee-fun.github.io/trial/board/' + link['href']) # 링크로 들어가기
        rest_title = BeautifulSoup(rest.content, 'html.parser')
        conts = rest_title.select('div.comment_view')
        if title != None:
            excel_sheet.append([index-1, title.get_text(), repl.get_text()])
            for j in conts:
                excel_sheet.append(["","",j.get_text().strip().replace("\n", "").replace("\t", "")])
            '''
            print(index-1, title.get_text().strip(), ", ", repl.get_text(),"개")
            for j in conts:
                print('ㄴ', j.get_text().strip().replace("\n", "").replace("\t", ""))
            '''
excel_file.save('crawling.xlsx')
excel_file.close()


# 2

import requests, openpyxl, pandas as pd
from bs4 import BeautifulSoup
excel = openpyxl.Workbook()
excel_sheet = excel.active
excel_sheet.title = 'crawling'
header = ['카테고리', '아이템 명칭', '가격']
excel_sheet.column_dimensions['B'].width = 100
excel_sheet.append(header)

for page_num in range(1,3):
        res = requests.get(f'https://startcoding.pythonanywhere.com/basic?page={page_num}'+'&keyword=') # &keyword=는 지워줘도 된다
        soup = BeautifulSoup(res.content, 'html.parser')
        items = soup.select('div.product')
        for i in items:
            category = i.select_one('p.product-category').get_text()
            name = i.select_one('h3.product-name').get_text()
            price = i.select_one('h4.product-price').get_text().strip().split('원')[0].replace(',','')
            excel_sheet.append([category, name, price])

excel.save('crwaling_test.xlsx')
excel.close()

```


# 자동화
``` python

# 마우스 자동화 

import pyautogui
import time
print(pyautogui.size()) # 화면 사이즈

print(pyautogui.position()) # 마우스 위치
pyautogui.moveTo(1100,500,1) # 마우스 이동
pyautogui.click()
pyautogui.click(button='right')
pyautogui.doubleClick()
pyautogui.click(clicks=3, interval=1) # 3번 클릭하되 1초 간격으로 클릭
pyautogui.dragTo(532,22)
pyautogui.mouseInfo() # 마우스 위치 정보 실시간

# 키보드
pyautogui.write('startcoding', interval = 0.25)
pyautogui.press('enter')
pyautogui.press('up')
pyautogui.hotkey('ctrl', 'c')
pyperclip.copy('#한글 가눙?')
pyautogui.hotkey('ctrl','v')
pyautogui.alert('시작하겠습니까?')


```