
# crawling 결과를 openpyxl을 이용해 저장하기
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


# crawling 결과를 pandas를 이용해 저장하기
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