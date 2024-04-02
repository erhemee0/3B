
import requests
import urllib.request
from bs4 import BeautifulSoup
import re
URL = "https://www.unegui.mn/avto-mashin/-avtomashin-zarna/toyota/"
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")
job_elements = soup.find_all('div', id=re.compile('\d{7}'))
# print(job_elements)
for job_element in job_elements:
    # name = job_element.find("div", class_="ad")
    print(job_element)
#     company = job_element.find("div", class_="company").a.b.text
#     details = name.find('a')['href']
#     job = requests.get(URL+details)
#     minisoup = BeautifulSoup(job.content, "html.parser")
#     additional = minisoup.findAll('div', attrs={'class' : 'details'})
#     info = additional[0].text
#     result = []
#     current_word = ""
    
#     for char in info:
#         if char.isupper():
#             result.append(current_word)
#             current_word = char
#         else:
#             current_word += char
#     result.append(current_word)
#     start_index = result.index('Салбар') if 'Салбар' in result else None
#     end_index = None
    
#     for i in range(len(result)):
#         if result[i].startswith('Цалин'):
#             end_index = i
#             break
            
#     if start_index is not None and end_index is not None and start_index < end_index:
#         result = result[start_index:end_index]
    
#     salary_element = job_element.find("span", class_="fsal").text
#     location_element = job_element.find("span", class_="floc").text
#     date_element = job_element.find("span", class_="sdate").text
    
#     print("Компани: " + company)
#     print("Ажлын зар: " + name.a.b.text)
#     print("Цалин: " + salary_element)
    
  
            
#     print("Байршил: " + location_element)
#     print("Он сар: " + date_element + "\n")