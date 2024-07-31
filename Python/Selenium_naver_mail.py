from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options
import time
import pyperclip
import pyautogui

# options.add_argument('--headless')  # 브라우저를 숨기고 싶다면 이 옵션 추가
# options.add_argument('--disable-gpu')

# Optinos을 chrome_options로 객체 생성
chrome_options = Options() 
# 브라우저 창 분리 옵션 추가 및 창 닫지 않기
chrome_options.add_experimental_option("detach", True)
# 크롬 드라이버 초기화
driver = webdriver.Chrome(options = chrome_options)
# 주소 받기
driver.get("https://nid.naver.com/nidlogin.login?mode=form&url=https://www.naver.com/")
driver.maximize_window() #최대화

id = driver.find_element(By.CSS_SELECTOR, "#id")
id.click()
pyperclip.copy("ddarkan")
pyautogui.hotkey("ctrl", "v")
time.sleep(0.5)

pw = driver.find_element(By.CSS_SELECTOR, "#pw")
pw.click()
pyperclip.copy("2016loveyou")
pyautogui.hotkey("ctrl", "v")
time.sleep(0.5)

#아이디 입력창
# id = driver.find_element(By.CSS_SELECTOR, "#id")
# id.send_keys("ddarkan")
# time.sleep(2)

# #비번 입력창
# pw = driver.find_element(By.CSS_SELECTOR, "#pw")
# pw.send_keys("2016loveyou")
# time.sleep(2)

#로그인
driver.find_element(By.CSS_SELECTOR, "#log\.login").click()
time.sleep(2)

# 메일-메일 쓰기 들어가기
driver.get("https://mail.naver.com/v2/folders/0/all")
time.sleep(2)

write = driver.find_element(By.CSS_SELECTOR, "#root > div > nav > div > div.lnb_header > div.lnb_task > a.item.button_write").click()
time.sleep(2)
# 받는 사람, 제목, 내용 입력
receipient = driver.find_element(By.CSS_SELECTOR, "#recipient_input_element")
receipient.click()
receipient.send_keys("bincentiver@gmail.com")
time.sleep(2)
pyautogui.press('enter')
title = driver.find_element(By.CSS_SELECTOR, "#subject_title")
title.click()
title.send_keys("automation test")
time.sleep(2)

# iframe 안으로 들어가서 본문
iframe = driver.find_element(By.CSS_SELECTOR, "#content > div.contents_area > div > div.editor_area > div > div.editor_body > iframe")
driver.switch_to.frame(iframe)
contents = driver.find_element(By.CSS_SELECTOR, "body > div > div.workseditor-content")
contents.send_keys("This is for test")
time.sleep(2)
driver.switch_to.default_content()
send = driver.find_element(By.CSS_SELECTOR, "#content > div.mail_toolbar.type_write > div:nth-child(1) > div > button.button_write_task").click()

# 드라이버 종료
driver.quit()
