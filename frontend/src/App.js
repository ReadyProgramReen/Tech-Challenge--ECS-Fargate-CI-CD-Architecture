import React, { useEffect, useState } from 'react'
import './App.css';
import API_URL from './config'

function App() {
  const [successMessage, setSuccessMessage] = useState()
  const [failureMessage, setFailureMessage] = useState()

  useEffect(() => {
    const getId = async () => {
      try {
        const resp = await fetch(API_URL)
        setSuccessMessage((await resp.json()).id)
      }
      catch (e) {
        setFailureMessage(e.message)
      }
    }
    getId()
  })

  return (
    <div className="App">
      <h2>Tech Challenge 1 - ECS Fargate CI/CD</h2>
      <p>Frontend → Backend connectivity check</p>
      {!failureMessage && !successMessage ? <p>Connecting to backend...</p> : null}
      {failureMessage ? <p style={{ color: 'red' }}>❌ Connection failed: {failureMessage}</p> : null}
      {successMessage ? <p style={{ color: 'green' }}>✅ SUCCESS — Backend responded with ID: {successMessage}</p> : null}
    </div>
  );
}

export default App;