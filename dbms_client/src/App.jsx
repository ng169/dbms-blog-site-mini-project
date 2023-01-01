import React, { useState, useEffect } from 'react';
import './App.css';

function App() {
  const [currentTime, setCurrentTime] = useState(0);

  useEffect(() => {
    fetch('http://localhost:5000/time').then(res => { console.log(res); return res.json(); }).then(data => {
      setCurrentTime(data.time);
    });
  }, []);

  return (
    <div className="App">
      <header className="App-header">

        <p>The current time is {currentTime}.</p>
      </header>
    </div>
  );
}

export default App;