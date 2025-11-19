from selenium import webdriver
from selenium.webdriver.common.by import By
import time
driver = webdriver.Chrome()
driver.get("https://the-internet.herokuapp.com/iframe")
 # iFrames #
driver.switch_to.frame("mce_0_ifr") 
print("Switched to iframe")
 # Switch to the iframe using frame ID
 # Homework: Try switch_to using iframe XPATH
iframe_body = driver.find_element(By.TAG_NAME, "body") 
iframe_body.send_keys("India")
time.sleep(2)
 # Enter text into iframe
 # Switch back to the main document 
driver.switch_to.default_content()
 # Verify you are outside iframe and on main document
main_header = driver.find_element(By.TAG_NAME, "h3") 
print("Main Document Header:", main_header.text)
driver.quit()
