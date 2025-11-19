from selenium import webdriver
import time
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select

driver=webdriver.Chrome()
driver.get("https://demoqa.com/select-menu")

multi_select_element=driver.find_element(By.ID,"cars")
multi_select=Select(multi_select_element)

# multi_select.select_by_visible_text("Volvo")
# time.sleep(2)
# multi_select.deselect_by_visible_text("Volvo")
# time.sleep(2)

# multi_select.select_by_index(1)
# time.sleep(2)
# multi_select.select_by_value("audi")
# time.sleep(2)
all_selected_opt_list=multi_select.all_selected_options
for opt in all_selected_opt_list:
    print(opt.text)
time.sleep(2)

multi_select.deselect_by_index(0)
time.sleep(1)
multi_select.deselect_by_value("audi")
time.sleep(1)
multi_select.deselect_all()
time.sleep(1)
