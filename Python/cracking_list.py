a = input()
data_list = a.split(",")
print(data_list)
for i in data_list:
    print(i)

"""
dd,ss,dd,ff 입력
결과: 
['dd', 'ss', 'dd', 'ff'] data_list의 값
아래는 for 문 결과값
dd
ss
dd
ff
"""

data = input()
print(type(data))
for i in data.split(","):
    print(i[1:-1])
"""
[Dave],[David],[Andy],[Arthor] 입력
<class 'str'> 타입
아래는 for 문 결과값
Dave
David
Andy
Arthor
"""

list_data = ["fun-coding", "Dave", "Linux", "Python", "javascript", "front-end", "back-end", "dataengineering"]
for i in list_data:
    print(i)

"""
결과값
fun-coding
Dave
Linux
Python
javascript
front-end
back-end
dataengineering
"""

data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for i in range(9,-1,-1):
    print(data[i])

## 위와 같은 결과값을 반환
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
data.reverse()
for item in data:
    print (item)
## -> [10,9,8,7,6,5,4,3,2,1]

## 리스트 속 글자(.docx) 자르기
filelist = ['exercise01.docx', 'exercise02.docx', 'exercise03.docx', 'exercise04.docx', 'exercise05.docx']
for filename in filelist:
    filelist_item = filename.split(".")
    print (filelist_item)
    print(filelist_item[0])

'''
['exercise01', 'docx']
exercise01
['exercise02', 'docx']
exercise02
['exercise03', 'docx']
exercise03
['exercise04', 'docx']
exercise04
['exercise05', 'docx']
exercise05
'''
