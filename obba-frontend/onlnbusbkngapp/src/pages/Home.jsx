import React from 'react';
import "./Home.css";  // Make sure you create Home.css

const Home = () => {
  return (
    <div className="container">
      <h1 className="title">Welcome to Online Bus Ticket Booking</h1>
      <p className="subtitle">Search and book bus tickets easily.</p>

      {/* Moving Bus SVG */}
      <div className="bus-container">
        <svg
          version="1.1"
          id="bus"
          xmlns="http://www.w3.org/2000/svg"
          xmlnsXlink="http://www.w3.org/1999/xlink"
          viewBox="0 0 200 100"
          xmlSpace="preserve"
          className="bus-svg"
        >
          <rect x="10" y="30" width="80" height="40" fill="blue"></rect>
          <circle cx="20" cy="70" r="10" fill="black"></circle>
          <circle cx="70" cy="70" r="10" fill="black"></circle>
        </svg>
      </div>
    </div>
  );
};

export default Home;
