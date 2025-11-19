import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
driver=webdriver.Chrome()
driver.get("https://www.google.com/")
search_txtbox=driver.find_element(By.XPATH,"//textarea[@name='q']")
time.sleep(3)
# By tag + name  Selects <textarea> with name=q
# //:- search for the element in whole document not just at specific level
search_txtbox.send_keys('imcc')
time.sleep(3)
search_txtbox.send_keys(Keys.ENTER)
