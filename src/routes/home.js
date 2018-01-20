const express = require('express');
require('env2')('./config.env');

const app = express.Router();

module.exports = [
  app.get('/', (req, res) => {
    res.send('Hello world');
    const options = {
      extensions: ['htm', 'html'],
      index: false,
      redirect: false,
      setHeaders(res, path, stat) {
        res.set('x-timestamp', Date.now());
      },
    };

    app.use(express.static('public', options));
  }),
];
