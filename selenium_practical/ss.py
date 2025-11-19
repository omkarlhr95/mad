
# from selenium import webdriver
# from selenium.webdriver.common.by import By
# driver = webdriver.Chrome()
# driver.get("https://www.google.com")
# driver.maximize_window()
# searchtextbox = driver.find_element(By.NAME, 'q')
# print(searchtextbox.rect)
# g_logo=driver.find_element(By.XPATH,"(//*[name()='svg'][@aria-label='Google'])[1]")
# g_logo.screenshot("img_searchtxbox.png")
# driver.screenshot("img_fullscreen.png")
# print(driver.get_cookies())
# print(driver.get_cookie('NID'))
# print(driver.get_cookie('AEC'))
# print(driver.get_window_position(driver.current_window_handle))
# driver.set_window_rect(100, 200, 300, 400)
from selenium import webdriver
import time

driver = webdriver.Chrome()
driver.get("https://www.google.com/")
time.sleep(3)  # wait for cookies to load

# Get all cookies
cookies = driver.get_cookies()

# Print all cookie names
for cookie in cookies:
    print(cookie)

print("NID cooke details:")
print(driver.get_cookie('NID'))

driver.quit()
