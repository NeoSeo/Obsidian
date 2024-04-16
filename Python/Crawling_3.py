
## 페이지 오류 여부 검사
import requests
from bs4 import BeautifulSoup

res = requests.get('https://davelee-fun.github.io/')
if res.status_code != 200: ## 페이지가 있는지 확인하는 건 status_code로 확인
  print('페이지 없음')
else:
  soup = BeautifulSoup(res.content, 'html.parser')
  items = soup.select('h1')

## 여러 페이지 크롤링

## request에 반복문으로 여러페이지 호출
for page_num in range(3):
    if page_num == 0:
        res = requests.get('https://davelee-fun.github.io/') # 1 page가 보통 숫자 페이지로 되어 있지 않기 때문
    else:
        res = requests.get('https://davelee-fun.github.io/page' + str(page_num + 1))
    soup = BeautifulSoup(res.content, 'html.parser')
    data = soup.select('h4.card-text')
    for item in data:
      print (item.get_text().strip())


