// Home.js
import React from 'react';
import { Link } from 'react-router-dom';
import headerImage from '../assets/diabetes-header.jpg';  // Replace with your path to a suitable image
import '../css/home.css';  // Ensure the CSS path is correct

function Home() {
  return (
    <div className="home-container">
      <nav className="main-nav">
        <div className="nav-logo">
          <Link to="/">PredicXO</Link>
        </div>
        <div className="nav-items">
          <Link to="/login" className="nav-item">Login</Link>
          <Link to="/register" className="nav-item">Sign Up</Link>
        </div>
      </nav>

      <header className="hero-section">
        <div className="hero-text">
          <h1>Welcome to PredicXO</h1>
          <p>Explore your health with our state of the art diabetes prediction system.</p>
          <Link to="/login" className="btn btn-primary">Get Started</Link>
        </div>
        <div className="hero-image">
          <img src={headerImage} alt="Hero" />
        </div>
      </header>

      <section className="features">
        <h2>Why Choose Us?</h2>
        <div className="feature-cards">
          <div className="feature-card">
            <h3>Accurate Predictions</h3>
            <p>Utilize advanced AI algorithms to ensure high accuracy in diabetes risk assessment.</p>
          </div>
          <div className="feature-card">
            <h3>User-Friendly Interface</h3>
            <p>Our platform is designed for ease of use, ensuring a seamless experience for all users.</p>
          </div>
          <div className="feature-card">
            <h3>Instant Results</h3>
            <p>Receive immediate feedback, allowing for quick health management decisions.</p>
          </div>
        </div>
      </section>

      <footer className="home-footer">
        <p>© 2024 DiabetesPredict. All rights reserved.</p>
      </footer>
    </div>
  );
}

export default Home;
