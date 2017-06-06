const express = require('express');
require('env2')('./config.env');

const app = express.Router();

module.exports = [
  app.get('/', (req, res) => {
    res.send('Hello world');
    res.status(200);
  }),
];
