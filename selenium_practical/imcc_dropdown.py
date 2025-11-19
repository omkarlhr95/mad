from selenium import webdriver
from selenium.webdriver.common.by import By
import time
from selenium.webdriver.common.keys import Keys
driver=webdriver.Chrome()
driver.get("https://www.google.com/")
search_txtbox=driver.find_element(By.XPATH,"//textarea[@name='q']")
search_txtbox.send_keys('imcc')
time.sleep(2)
# imcc_dropdown=driver.find_element(By.XPATH,"//span[contains(normalize-space(),'imcc')]")
imcc_dropdown=driver.find_element(By.XPATH,"//span[text()='imcc pune']")

time.sleep(2)
imcc_dropdown.click()
# search_txtbox.send_keys(Keys.ENTER)
time.sleep(20)