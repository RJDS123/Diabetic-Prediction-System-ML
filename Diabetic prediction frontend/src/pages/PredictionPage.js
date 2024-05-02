// Prediction.js
import React, { useState } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import '../css/prediction.css';

function Prediction() {
  
  const [formData, setFormData] = useState({
    Pregnancies: '',
    Glucose: '',
    BloodPressure: '',
    SkinThickness: '',
    Insulin: '',
    BMI: '',
    Age: ''
  });
  const [result, setResult] = useState('');

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axios.post('http://localhost:5000/predict', formData);
      setResult(response.data.prediction);
    } catch (error) {
      console.error('Prediction error:', error);
    }
  };


  return (
    <div className="prediction-page">
    <nav className="main-nav">
        <div className="nav-logo">
          <Link to="/">PredicXO</Link>
        </div>
        <div className="nav-items">
        <Link to="/">Log Out</Link>
        </div>
      </nav>
    <div className="prediction-container">
      <h2>Diabetes Prediction</h2>
      <form onSubmit={handleSubmit} className="prediction-form">
        <div className="form-group">
          <label>Pregnancies</label>
          <input type="text" name="Pregnancies" value={formData.Pregnancies} onChange={handleInputChange} required/>
        </div>
        <div className="form-group">
          <label>Glucose</label>
          <input type="text" name="Glucose" value={formData.Glucose} onChange={handleInputChange} required/>
        </div>
        <div className="form-group">
          <label>Blood Pressure</label>
          <input type="text" name="BloodPressure" value={formData.BloodPressure} onChange={handleInputChange} required/>
        </div>
        <div className="form-group">
          <label>Skin Thickness</label>
          <input type="text" name="SkinThickness" value={formData.SkinThickness} onChange={handleInputChange} required/>
        </div>
        <div className="form-group">
          <label>Insulin</label>
          <input type="text" name="Insulin" value={formData.Insulin} onChange={handleInputChange} required/>
        </div>
        <div className="form-group">
          <label>BMI</label>
          <input type="text" name="BMI" value={formData.BMI} onChange={handleInputChange} required/>
        </div>
        <div className="form-group">
          <label>Age</label>
          <input type="text" name="Age" value={formData.Age} onChange={handleInputChange} required/>
        </div>
        <button type="submit" className="btn btn-primary" id="predict" >Predict</button>
      </form>
      {result && <div className="result" id="result">
        <h2>Prediction Result: {result}</h2>
      </div>}
    </div>
    <footer className="home-footer">
        <p>© 2024 Diabetes Prediction System. All rights reserved.</p>
      </footer>
    </div>
  );
}

export default Prediction;
