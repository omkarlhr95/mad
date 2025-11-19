from selenium import webdriver
from selenium.webdriver.common.by import By
import time

driver=webdriver.Chrome()
driver.get("https://the-internet.herokuapp.com/nested_frames")
driver.maximize_window()

driver.switch_to.frame("frame-top")
time.sleep(2)
print("Switched to frame-top")

driver.switch_to.frame("frame-left")
print("Switched to frame-left")
time.sleep(2)

left_frame=driver.find_element(By.TAG_NAME,"body")
print("Left Frame Text:",left_frame.text)
time.sleep(2)

driver.switch_to.parent_frame()
print("Switched back to frame-top")
time.sleep(2)

driver.switch_to.frame("frame-middle")
print("Switched to frame-middle")
time.sleep(2)

middle_frame=driver.find_element(By.TAG_NAME,"body")
print("Middle Frame Text:",middle_frame.text)
time.sleep(2)

driver.switch_to.parent_frame()
print("Switched back to frame-top")
time.sleep(2)

driver.switch_to.default_content()
time.sleep(2)

driver.switch_to.frame("frame-bottom")
bottom_frame=driver.find_element(By.TAG_NAME,"body")
print("Bottom Frame Text:",bottom_frame.text)
time.sleep(2)

driver.quit()