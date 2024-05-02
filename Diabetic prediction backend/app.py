from flask import Flask, request, jsonify, session, redirect, url_for
from flask_cors import CORS
import pickle
import numpy as np
import mysql.connector
import base64
from werkzeug.security import generate_password_hash, check_password_hash
import pandas as pd  

app = Flask(__name__)
CORS(app, resources={r"/login": {"origins": "http://localhost:3000"}})
CORS(app, resources={r"/register": {"origins": "http://localhost:3000"}})
CORS(app, resources={r"/predict": {"origins": "http://localhost:3000"}})
CORS(app, resources={r"/logout": {"origins": "http://localhost:3000"}})
app.secret_key = 'your_secret_key'  

# Configure the MySQL database
db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",  
    database="diabetes_prediction"
)

# Load the trained diabetes model
model_filename = 'diabetic_predict_model.pkl'
with open(model_filename, 'rb') as file:
    model = pickle.load(file)

@app.route('/register', methods=['POST'])
def register():
    data = request.json
    email = data.get('email')
    password = data.get('password')
    full_name = data.get('full_name')
    contact_number = data.get('contact_number')

    if not all([email, password, full_name, contact_number]):
        return jsonify({'error': 'All fields are required'}), 400

    # Encrypt email and password for security
    encrypted_email = base64.b64encode(email.encode()).decode()
    hashed_password = generate_password_hash(password)

    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users WHERE email = %s", (encrypted_email,))
    if cursor.fetchone():
        return jsonify({'error': 'Email already registered'}), 409


    cursor.execute("""
        INSERT INTO users (email, password, full_name, contact_number) 
        VALUES (%s, %s, %s, %s)
    """, (encrypted_email, hashed_password, full_name, contact_number))
    db.commit()
    cursor.close()
    return jsonify({'message': 'User registered successfully'}), 201

@app.route('/login', methods=['POST'])
def login():
    data = request.json
    email = base64.b64encode(data.get('email').encode()).decode()
    password = data.get('password')

    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT * FROM users WHERE email = %s", (email,))
    user = cursor.fetchone()
    if user and check_password_hash(user['password'], password):
        session['user_id'] = user['user_id']  # Store user ID in session
        return jsonify({'message': 'Login successful', 'success': True}), 200
    else:
        # Make sure to return a 401 status code when the login is not successful
        return jsonify({'error': 'Invalid email or password', 'success': False}), 401




@app.route('/predict', methods=['POST'])
def predict_diabetes():
    data = request.json
    required_fields = ['Pregnancies', 'Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI', 'Age']
    if not all(field in data for field in required_fields):
        return jsonify({'error': 'Missing data for required fields'}), 400

    try:
        # Create a DataFrame with the input data, preserving the feature names
        input_features = pd.DataFrame([data], columns=required_fields)
        
        # Predict using the loaded model
        prediction = model.predict(input_features)
        prediction_result = 'Diabetic' if prediction[0] == 1 else 'Not Diabetic'

        # Encrypt user data and prediction result
        encrypted_data = {key: base64.b64encode(str(value).encode()).decode() for key, value in data.items()}
        encrypted_result = base64.b64encode(prediction_result.encode()).decode()

        # Save encrypted data and result to the database
        cursor = db.cursor()
        cursor.execute("""
            INSERT INTO predictions (pregnancies, glucose, blood_pressure, skin_thickness, insulin, bmi, age, prediction_result) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """, (
            encrypted_data['Pregnancies'], encrypted_data['Glucose'], encrypted_data['BloodPressure'], 
            encrypted_data['SkinThickness'], encrypted_data['Insulin'], encrypted_data['BMI'], 
            encrypted_data['Age'], encrypted_result))
        db.commit()
        cursor.close()

        return jsonify({'prediction': prediction_result}), 200

    except Exception as e:
        return jsonify({'error': 'Error processing prediction: {}'.format(str(e))}), 500


@app.route('/logout', methods=['POST'])
def user_logout():
    try:
        # Clear the customer_id from the session to logout
        session.pop('user_id', None)
        return jsonify({'message': 'User logged out successfully'}), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
