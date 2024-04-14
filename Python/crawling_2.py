from urllib.request import urlopen ## <- 이 부분
from bs4 import BeautifulSoup

res = urlopen('https://davelee-fun.github.io/') ## <-- 이 부분만 다름
soup = BeautifulSoup(res, 'html.parser')

data = soup.select('h4.card-text')
for item in data:
    print (item.get_text().strip())

