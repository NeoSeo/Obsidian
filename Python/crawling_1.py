import requests
from bs4 import BeautifulSoup
res = requests.get('https://davelee-fun.github.io/blog/crawl_test')
soup = BeautifulSoup(res.content,'html.parser')

section =  soup.find(id="dev_course_list")
titles = section.find_all('li', 'course') ## find_all로 다 긁어오기
for index, i in enumerate(titles): # index 와 enumerate로 번호 넣기
    print(str(index+1)+'.', i.get_text().split('[')[0].split('-')[1].strip())  ##strip.()은 스페이스 제거. 혹은 strip(' ')으로 쓸 수도 있다.
## split은 리스트로 '[', '-'으로 해체하고 각 인덱스에 해당하는 데이터 불러오기 거기다 strip으로 앞뒤 공백 제거. strip('dd') 하면 dd 문자열 제거



## select를 이용한 크롤링. 기본적으로 find_all 처럼 다 긁어 온다.

import requests
from bs4 import BeautifulSoup
res = requests.get('https://davelee-fun.github.io/blog/crawl_test_css.html')
soup = BeautifulSoup(res.content,'html.parser')
items = soup.select('ul#hobby_course_list li.course') ## ('ul > a') 라고 하면  ul 태그 밑에 바로 a라는 태그가 있으면 크롤링.
itemss = soup.select_one('ui#dev_course_list > li.course.paid') #크롤링 중 맨위 꺼만 뽑기
itemsss = soup.select('.course.paid') # class는 .class명칭. class가 복수일 때는.으로 계속 이어준다. id 크롤링읕 #id명칭 ex) #start
for index, item in enumerate(items):
    if index == 1: ## 두번째 인덱스 뽑기
        print (item.get_text())

## select로 뽑을 경우 리스트 형태 select_one으로 뽑으로 경우 object 타입이 반화

from bs4 import BeautifulSoup
import requests
res = requests.get('https://davelee-fun.github.io/blog/crawl_html_css.html')
soup = BeautifulSoup(res.content, 'html.parser')
items = soup.select('tr') ## select 대신 find_all을 써도 된다.
for i in items:
    cols = i.select('td')
    row_str = ''
    for col in cols:
        row_str += '.. '+col.get_text()
    print(row_str[2:])
