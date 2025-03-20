import React, { useState, useEffect } from "react";
import { useParams } from "react-router-dom";
import axios from "axios";

const Booking = () => {
  const { busId } = useParams();  // Get busId from URL
  const [bus, setBus] = useState(null);
  const [seats, setSeats] = useState(1);
  const [bookingStatus, setBookingStatus] = useState("");

  // Fetch bus details on page load
  useEffect(() => {
    axios
      .get(`http://localhost:8080/api/buses/${busId}`)
      .then((response) => setBus(response.data))
      .catch((error) => console.error("Error fetching bus details:", error));
  }, [busId]);

  if (!bus) return <p>Loading bus details...</p>;

  return (
    <div className="container">
      <h2>Bus Booking</h2>
      <p><strong>Bus:</strong> {bus.busNumber}</p>
      <p><strong>Route:</strong> {bus.source} → {bus.destination}</p>
      <p><strong>Departure Time:</strong> {bus.departureTime}</p>
      <p><strong>Available Seats:</strong> {bus.availableSeats}</p>
      <p><strong>Price:</strong> ₹{bus.price}</p>

      <label>Select Seats:</label>
      <input 
        type="number" 
        min="1" 
        max={bus.availableSeats} 
        value={seats} 
        onChange={(e) => setSeats(e.target.value)} 
      />

      <button>Proceed to Payment</button>
    </div>
  );
};

export default Booking;
