import React, { useState } from 'react';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';
import loginImage from '../assets/login-image.png'; // Make sure this path is correct
import '../css/login.css';  // Make sure this path is correct

function Login() {
    const navigate = useNavigate();
    const [formData, setFormData] = useState({ email: '', password: '' });
    const [error, setError] = useState('');

    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };

    const handleLogin = async (e) => {
        e.preventDefault();
        try {
            const response = await axios.post('http://localhost:5000/login', formData);
            if (response.data.success) {
                navigate('/prediction');
            } else {
                // If the server responds, but login is unsuccessful, show specific message
                setError('Failed to login. Please check your credentials.');
            }
        } catch (err) {
            // If an error occurs during the request or server doesn't respond
            if (err.response && err.response.status === 401) {
                // If the error response code is 401 (Unauthorized), it's a login failure
                setError('Failed to login. Please check your credentials.');
            } else {
                // For other types of errors
                setError('An error occurred. Please try again later.');
            }
        }
    };
    

    return (
        <div className="login-page">
      <nav className="main-nav">
        <div className="nav-logo">
          <Link to="/">PredicXO</Link>
        </div>
      </nav>
            <div className="login-container">
                <div className="login-image">
                  <img src={loginImage} alt="Hero" />
                </div>
                <div className="login-form-container">
                    
                    <form onSubmit={handleLogin} className="login-form">
                    <h2>Login to Your Account</h2>
                        <div className="form-group">
                            
                            <label>Email</label>
                            <input type="email" name="email" placeholder="Enter your email" value={formData.email} onChange={handleInputChange} required />
                        </div>
                        <div className="form-group">
                            <label>Password</label>
                            <input type="password" name="password" placeholder="Enter your password" value={formData.password} onChange={handleInputChange} required />
                        </div>
                        {error && <div className="login-error">{error}</div>}
                        <button type="submit" className="btn-login">Login</button>
                        <div className="register-link">
                            Need an account? <Link to="/register">Register here.</Link>
                        
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

export default Login;
