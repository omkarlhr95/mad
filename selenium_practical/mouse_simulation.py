from selenium import webdriver
from selenium.webdriver.common.by import By
import time
from selenium.webdriver.common.action_chains import ActionChains

driver=webdriver.Chrome()
driver.get("https://imcc.mespune.in/")
time.sleep(5)
program_menu=driver.find_element(By.XPATH,"//li[@id='menu-item-4383']")
time.sleep(2)
actions = ActionChains(driver) 
actions.move_to_element(program_menu).perform()
time.sleep(5)
