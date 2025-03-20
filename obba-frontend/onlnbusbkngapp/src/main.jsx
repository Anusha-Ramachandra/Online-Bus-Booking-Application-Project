import 'bootstrap/dist/css/bootstrap.min.css';
import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Booking from "./pages/Booking";
import Login from "./pages/Login";
import Register from "./pages/Register";
import SearchBuses from "./pages/SearchBuses"; // Import SearchBuses
import Navbar from "./components/Navbar";
import Footer from "./components/Footer"; // Import Footer
import ProtectedRoute from "./components/ProtectedRoute";
import "./index.css";
import "./styles.css"; // Import custom styles

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <Router>
      <Navbar />
      <div className="main-content">
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/search" element={<ProtectedRoute><SearchBuses /></ProtectedRoute>} />
          <Route path="/booking" element={<ProtectedRoute><Booking /></ProtectedRoute>} />
        </Routes>
      </div>
      <Footer />
    </Router>
  </React.StrictMode>
);
