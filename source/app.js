// app.js
const path = require('node:path')
const express = require('express')
const app = express()
const port = 3000

// Serve static files from the 'public' directory
app.use(express.static('public'))

// Route for the homepage
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, '/views/index.html'))
})

// Start the server
app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`)
})
