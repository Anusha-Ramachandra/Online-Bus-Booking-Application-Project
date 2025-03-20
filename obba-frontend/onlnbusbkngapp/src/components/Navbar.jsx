import React from "react";
import { Link, useNavigate } from "react-router-dom";
import { Navbar, Nav, Container, Button } from "react-bootstrap";
import { FaBus } from "react-icons/fa"; // Bus Icon

const CustomNavbar = () => {
  const token = localStorage.getItem("token");
  const navigate = useNavigate();

  const handleLogout = () => {
    localStorage.removeItem("token");
    navigate("/login");
  };

  return (
    <Navbar expand="lg" className="custom-navbar">
      <Container>
        {/* Navbar Brand with Bus Icon */}
        <Navbar.Brand className="navbar-brand" as={Link} to="/">
          <FaBus className="bus-icon" /> Bus Ticket Booking
        </Navbar.Brand>

        {/* Toggle Button for Mobile View */}
        <Navbar.Toggle aria-controls="basic-navbar-nav" />

        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="ms-auto">
            <Nav.Link as={Link} to="/" className="nav-link">Home</Nav.Link>
            <Nav.Link as={Link} to="/search" className="nav-link">Search Buses</Nav.Link>

            {token ? (
              <>
                <Nav.Link as={Link} to="/booking" className="nav-link">My Bookings</Nav.Link>
                <Button variant="outline-light" className="logout-btn" onClick={handleLogout}>
                  Logout
                </Button>
              </>
            ) : (
              <>
                <Nav.Link as={Link} to="/login" className="nav-link">Login</Nav.Link>
                <Nav.Link as={Link} to="/register" className="nav-link">Register</Nav.Link>
              </>
            )}
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
};

export default CustomNavbar;
