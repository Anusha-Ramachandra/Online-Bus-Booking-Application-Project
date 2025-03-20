import React, { useState } from "react";
import axios from "axios";

const SearchBuses = () => {
  const [source, setSource] = useState("");
  const [destination, setDestination] = useState("");
  const [departureTime, setDepartureTime] = useState("");
  const [buses, setBuses] = useState([]);  // Ensures buses is an array
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSearch = async (e) => {
    e.preventDefault();
    setError("");
    setLoading(true);

    try {
      const token = localStorage.getItem("token");

      if (!token) {
        setError("You must be logged in to search for buses.");
        setLoading(false);
        return;
      }

      const params = { source, destination };
      if (departureTime) params.departureTime = departureTime;

      const response = await axios.get("http://localhost:8080/api/buses/search", {
        params,
        headers: { Authorization: `Bearer ${token}` }, // Ensure token is sent
      });

      if (!Array.isArray(response.data)) {
        console.error("Unexpected API response:", response.data);
        setError("Invalid response from server.");
        setBuses([]); 
        setLoading(false);
        return;
      }

      if (response.data.length === 0) {
        setError("No buses found for this route.");
      }

      setBuses(response.data);
    } catch (err) {
      if (err.response) {
        console.error("API Error:", err.response);
        if (err.response.status === 403) {
          setError("Unauthorized access. Please log in again.");
        } else {
          setError("Error fetching bus data. Please try again.");
        }
      } else {
        console.error("Unexpected error:", err);
        setError("A network error occurred.");
      }
    }

    setLoading(false);
  };

  return (
    <div className="container">
      <h2>Search for Buses</h2>
      <form onSubmit={handleSearch}>
        <label>Source:</label>
        <input
          type="text"
          placeholder="Enter source"
          value={source}
          onChange={(e) => setSource(e.target.value)}
          required
        />
        
        <label>Destination:</label>
        <input
          type="text"
          placeholder="Enter destination"
          value={destination}
          onChange={(e) => setDestination(e.target.value)}
          required
        />

        <label>Departure Time (Optional):</label>
        <input
          type="time"
          value={departureTime}
          onChange={(e) => setDepartureTime(e.target.value)}
        />

        <button type="submit" disabled={loading}>
          {loading ? "Searching..." : "Search"}
        </button>
      </form>

      {error && <p style={{ color: "red" }}>{error}</p>}

      {buses.length > 0 && (
        <div>
          <h3>Available Buses:</h3>
          <ul>
            {buses.map((bus) => (
              <li key={bus.id}>
                <strong>{bus.busNumber}</strong> - {bus.source} to {bus.destination},  
                Departure: {bus.departureTime}, Price: ₹{bus.price}
              </li>
            ))}
          </ul>
        </div>
      )}
    </div>
  );
};

export default SearchBuses;
