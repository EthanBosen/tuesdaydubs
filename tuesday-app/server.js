const express = require('express');
const path = require('path');
const morgan = require('morgan');
const helmet = require('helmet');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

// Security middleware
app.use(helmet());

// Logging middleware
app.use(morgan('combined'));

// Serve static files from the 'public' directory
app.use(express.static(path.join(__dirname, 'public')));

// Define routes for the buttons
app.get('/booking', (req, res) => {
    res.redirect('booking.html');
});

app.get('/social', (req, res) => {
    res.redirect('https://www.instagram.com/tuesdaydub/');
});

app.get('/payment', (req, res) => {
    res.redirect('payment.html');
});

app.get('/merch', (req, res) => {
    res.redirect('https://www.merchsite.com');
});

// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).send('Something broke!');
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});