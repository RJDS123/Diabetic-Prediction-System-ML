import React, { useState } from 'react';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';
import registerImage from '../assets/Diabetes-bro.png'; // Make sure this path is correct
import '../css/register.css'; // Ensure your CSS file is correctly referenced

function Register() {
    const navigate = useNavigate();
    const [formData, setFormData] = useState({
        email: '',
        password: '',
        confirmPassword: '',
        full_name: '',
        contact_number: ''
    });
    const [error, setError] = useState('');

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleSubmit = async (e) => {
        e.preventDefault();
        if (formData.password !== formData.confirmPassword) {
            setError('Passwords do not match.');
            return;
        }
    
        try {
            const response = await axios.post('http://localhost:5000/register', {
                email: formData.email,
                password: formData.password,
                full_name: formData.full_name,
                contact_number: formData.contact_number
            });
            // If the request is successful, redirect the user to the login page
            if (response.status === 201) {
                navigate('/login');
            }
        } catch (err) {
            if (err.response) {
                // If the backend returns a response, check if the email is already registered
                if (err.response.status === 409) {
                    setError('Email already registered.');
                } else {
                    // Handle any other errors that the backend returns
                    setError(err.response.data.error || 'Registration failed. Please try again.');
                }
            } else {
                // Handle errors that occur before the HTTP request is complete
                // This is likely a network error or some other issue preventing the request from being made
                setError('Server error. Please try again later.');
            }
        }
    };
    

    return (
        <div className="register-page">
    <nav className="main-nav">
        <div className="nav-logo">
          <Link to="/">PredicXO</Link>
        </div>
      </nav>
                <div className="register-container">
                    <div className="register-image">
                        <img src={registerImage} alt="Hero" />
                    </div>
            <div className="register-form-container">
            <form onSubmit={handleSubmit} className="register-form">
                <h2>Create Your Account</h2>
                <div className="form-group">
                    <label>Email</label>
                    <input
                        type="email"
                        name="email"
                        value={formData.email}
                        onChange={handleInputChange}
                        required
                    />
                </div>
                <div className="form-group">
                    <label>Password</label>
                    <input
                        type="password"
                        name="password"
                        value={formData.password}
                        onChange={handleInputChange}
                        required
                    />
                </div>
                <div className="form-group">
                    <label>Confirm Password</label>
                    <input
                        type="password"
                        name="confirmPassword"
                        value={formData.confirmPassword}
                        onChange={handleInputChange}
                        required
                    />
                </div>
                <div className="form-group">
                    <label>Full Name</label>
                    <input
                        type="text"
                        name="full_name"
                        value={formData.full_name}
                        onChange={handleInputChange}
                        required
                    />
                </div>
                <div className="form-group">
                    <label>Contact Number</label>
                    <input
                        type="text"
                        name="contact_number"
                        value={formData.contact_number}
                        onChange={handleInputChange}
                        required
                    />
                </div>
                {error && <div className="error-message">{error}</div>}
                <button type="submit" className="btn-register">Register</button>
                <div className="login-link">
                    <p>Already have an account? <Link to="/login">Log in here</Link>.</p>
                </div>
            </form>
            </div>
        </div>
        <footer className="home-footer">
        <p>© 2024 Diabetes Prediction System. All rights reserved.</p>
      </footer>
        </div>
    );
}

export default Register;
