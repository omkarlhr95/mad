from selenium import webdriver
from selenium.webdriver.common.by import By
import time
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

driver=webdriver.Chrome()
driver.get("https://www.facebook.com/")
wait=WebDriverWait(driver,10)

create_account_button=wait.until(EC.element_to_be_clickable((By.LINK_TEXT,"Create new account")))
time.sleep(2)
create_account_button.click()
time.sleep(2)

registration_form=wait.until(EC.visibility_of_element_located((By.XPATH,"//form[@id='reg']")))
first_name=wait.until(EC.presence_of_element_located((By.NAME,"firstname")))
last_name=wait.until(EC.presence_of_element_located((By.NAME,"lastname")))
mobile_number=wait.until(EC.presence_of_element_located((By.NAME,"reg_email__")))
password=wait.until(EC.presence_of_element_located((By.NAME,"reg_passwd__")))

first_name.send_keys("John")
last_name.send_keys("Doe")
mobile_number.send_keys("1234567890")
password.send_keys("SecurePass123")
time.sleep(2)

day=wait.until(EC.presence_of_element_located((By.ID,"day")))
month=wait.until(EC.presence_of_element_located((By.ID,"month")))
year=wait.until(EC.presence_of_element_located((By.ID,"year")))

day.send_keys("6")
month.send_keys("Jun")
year.send_keys("1990")

gender_male=wait.until(EC.presence_of_element_located((By.XPATH,"//input[@value='2']")))
gender_female=wait.until(EC.presence_of_element_located((By.XPATH,"//input[@value='1']")))
gender_custom=wait.until(EC.presence_of_element_located((By.XPATH,"//input[@value='-1']")))

gender_female.click()
time.sleep(2)

sign_up_button=wait.until(EC.element_to_be_clickable((By.NAME,"websubmit")))
sign_up_button.click()
time.sleep(2)

confirmation_message_wait=WebDriverWait(driver,120)
confirmation_message=confirmation_message_wait.until(EC.presence_of_element_located((By.XPATH,"//div[contains(text(),'Please confirm your account')]")))

