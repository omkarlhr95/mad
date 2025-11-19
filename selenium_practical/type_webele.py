from selenium import webdriver
from selenium.webdriver.common.by import By
driver=webdriver.Chrome()
driver.get("https://www.google.com/")
single_webel=driver.find_element(By.XPATH,"//textarea")
multi_webel=driver.find_elements(By.XPATH,"//textarea")
print(type(single_webel))
print(type(multi_webel))