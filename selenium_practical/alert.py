from selenium import webdriver # ALERTS #
from selenium.webdriver.common.by import By
driver = webdriver.Chrome()
driver.get("https://the-internet.herokuapp.com/javascript_alerts")
confirm_button=driver.find_element(By.XPATH,"//button[text()='Click for JS Confirm']")
confirm_button.click()
alert=driver.switch_to.alert
print("Alert text is:",alert.text)
alert.accept()
result=driver.find_element(By.ID,"result")
print("Result text before alert accept:",result.text)
driver.quit()