from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
import time

def setup_driver():
    """ Sets up the Chrome driver for Selenium tests. """
    options = webdriver.ChromeOptions()
    service = Service(ChromeDriverManager().install())
    driver = webdriver.Chrome(service=service, options=options)
    return driver

def test_registration(driver):
    """ Tests the registration process of a new user. """
    driver.get('http://localhost:3000/register')
    # Fill in the registration form fields
    email_input = driver.find_element(By.NAME, 'email')
    password_input = driver.find_element(By.NAME, 'password')
    confirm_password_input = driver.find_element(By.NAME, 'confirmPassword')
    full_name_input = driver.find_element(By.NAME, 'full_name')
    contact_input = driver.find_element(By.NAME, 'contact_number')
    
    # Input data for new user
    email_input.send_keys('newuser01@example.com')
    password_input.send_keys('password123')
    confirm_password_input.send_keys('password123')
    full_name_input.send_keys('New User')
    contact_input.send_keys('1234567890')
    
    # Click the register button
    register_button = driver.find_element(By.XPATH, '//button[@type="submit"]')
    register_button.click()
    
    # Allow time for registration process to complete
    time.sleep(5)

    try:
        assert 'login' in driver.current_url
        print("Registration successful, redirected to login page.")
    except AssertionError:
        print("Registration failed or wrong redirection.")

def test_login(driver):
    """ Tests the login functionality. """
    driver.get('http://localhost:3000/login')
    # Locate and fill the login form
    email_input = driver.find_element(By.NAME, 'email')
    password_input = driver.find_element(By.NAME, 'password')
    email_input.send_keys('newuser01@example.com')
    password_input.send_keys('password123')
    login_button = driver.find_element(By.XPATH, '//button[@type="submit"]')
    login_button.click()
    
    # Allow time for login and navigation
    time.sleep(5)
    # Check redirection to prediction page
    try:
        assert 'prediction' in driver.current_url
        print("Login successful, redirected to prediction page.")
    except AssertionError:
        print("Login failed or wrong redirection.")

def test_predict(driver):
    """ Tests the prediction functionality after logging in by filling out all required fields in the form. """
    driver.get('http://localhost:3000/prediction')
    
    # Simulate filling out the prediction form with all necessary fields
    pregnancies_input = driver.find_element(By.NAME, 'Pregnancies')
    glucose_input = driver.find_element(By.NAME, 'Glucose')
    blood_pressure_input = driver.find_element(By.NAME, 'BloodPressure')
    skin_thickness_input = driver.find_element(By.NAME, 'SkinThickness')
    insulin_input = driver.find_element(By.NAME, 'Insulin')
    bmi_input = driver.find_element(By.NAME, 'BMI')
    age_input = driver.find_element(By.NAME, 'Age')

    # Input example values for each field
    pregnancies_input.send_keys('2')
    glucose_input.send_keys('120')
    blood_pressure_input.send_keys('80')
    skin_thickness_input.send_keys('33')
    insulin_input.send_keys('150')
    bmi_input.send_keys('24.5')
    age_input.send_keys('45')
    
    # Locate and click the predict button
    predict_button = driver.find_element(By.XPATH, '//button[@id="predict"]')
    predict_button.click()
    
    # Allow time for the prediction result to be processed and displayed
    time.sleep(5)
    
    # Verify the prediction result is displayed correctly
    try:
        prediction_result_element = driver.find_element(By.ID, 'result')
        prediction_result = prediction_result_element.text
        print(f"Prediction result: {prediction_result}")
        
        # Asserting that prediction result contains expected text
        assert 'Diabetic' in prediction_result or 'Not Diabetic' in prediction_result
        print("Prediction test passed: correct prediction result displayed.")
        
    except AssertionError:
        print("Prediction test failed: incorrect prediction result.")

def run_tests():
    """ Manages the running of different Selenium tests. """
    driver = setup_driver()
    try:
        print("Testing Registration...")
        test_registration(driver)
        print("Testing Login...")
        test_login(driver)
        print("Testing Prediction...")
        test_predict(driver)
    except Exception as e:
        print(f"An error occurred: {str(e)}")
    finally:
        driver.quit()



if __name__ == "__main__":
    run_tests()
