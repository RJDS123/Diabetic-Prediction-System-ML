import unittest
import json
from app import app

class TestDiabetesApp(unittest.TestCase):

    @classmethod
    def setUpClass(cls):
        # Set up the app for testing
        cls.app = app.test_client()
        cls.app.testing = True

    def test_user_registration(self):
        # Define test data for user registration
        test_data = {
            'email': 'newuser@example.com',
            'password': 'newpass123',
            'full_name': 'New User',
            'contact_number': '1234567890'
        }

        # Send a POST request to the registration endpoint
        response = self.app.post('/register', json=test_data)

        # Check if the response status code is 201 (created)
        self.assertEqual(response.status_code, 201)

        # Parse the response JSON and check for the success message
        data = json.loads(response.data)
        self.assertEqual(data['message'], 'User registered successfully')

    def test_user_login_correct_data(self):
        # Define test data for user login
        test_data = {
            'email': 'newuser@example.com',
            'password': 'newpass123'
        }

        # Send a POST request to the login endpoint
        response = self.app.post('/login', json=test_data)

        # Check if the response status code is 200 (OK)
        self.assertEqual(response.status_code, 200)

        # Parse the response JSON and check for the login success message
        data = json.loads(response.data)
        self.assertTrue(data['success'])

    def test_user_login_wrong_data(self):
        # Define test data for user login with incorrect credentials
        test_data = {
            'email': 'newuser@example.com',
            'password': 'wrongpass123'
        }

        # Send a POST request to the login endpoint with incorrect password
        response = self.app.post('/login', json=test_data)

        # Check if the response status code is 401 (Unauthorized)
        self.assertEqual(response.status_code, 401)

        # Parse the response JSON and check for the error message
        data = json.loads(response.data)
        self.assertEqual(data['error'], 'Invalid email or password')

    def test_duplicate_registration(self):
        # Attempt to register with an email that's already been used
        test_data = {
            'email': 'newuser@example.com',
            'password': 'newpass123',
            'full_name': 'New User',
            'contact_number': '1234567890'
        }

        # Send another POST request to the registration endpoint with the same email
        response = self.app.post('/register', json=test_data)

        # Check if the response status code is 409 (conflict)
        self.assertEqual(response.status_code, 409)

        # Parse the response JSON and check for the error message
        data = json.loads(response.data)
        self.assertEqual(data['error'], 'Email already registered')

    def test_predict_diabetes(self):
        # Define test data to predict diabetes
        test_data = {
            'Pregnancies': 2,
            'Glucose': 120,
            'BloodPressure': 70,
            'SkinThickness': 35,
            'Insulin': 80,
            'BMI': 33.6,
            'Age': 50
        }

        # Send a POST request to the predict endpoint
        response = self.app.post('/predict', json=test_data)

        # Check if the response status code is 200 (OK)
        self.assertEqual(response.status_code, 200)

        # Parse the response JSON and check for the prediction result
        data = json.loads(response.data)
        self.assertIn(data['prediction'], ['Diabetic', 'Not Diabetic'])

    def test_user_logout(self):
        # This test assumes that there is a successful login prior to logout
        # Define test data for user login
        test_data = {
            'email': 'newuser@example.com',
            'password': 'newpass123'
        }

        # Send a POST request to the login endpoint
        self.app.post('/login', json=test_data)

        # Send a POST request to the logout endpoint
        response = self.app.post('/logout')

        # Check if the response status code is 200 (OK)
        self.assertEqual(response.status_code, 200)

        # Parse the response JSON and check for the logout success message
        data = json.loads(response.data)
        self.assertEqual(data['message'], 'User logged out successfully')


if __name__ == '__main__':
    unittest.main()
