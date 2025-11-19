import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select

driver=webdriver.Chrome()
driver.get("https://the-internet.herokuapp.com/dropdown")

mydropdown=driver.find_element(By.ID,"dropdown")
dropdown=Select(mydropdown)

dropdown.select_by_visible_text("Option 1")
time.sleep(2)
selected_option=dropdown.first_selected_option
print(f"Selected option:{selected_option.text}")

dropdown.select_by_value("2")
time.sleep(2)

dropdown.select_by_index(1)
time.sleep(2)