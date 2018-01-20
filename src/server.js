const express = require('express');
const bodyParser = require('body-parser');

const app = express();
// require('env2')('./config.env');
// const routes = require('./routes');
//
// app.use('/', express.static(`${__dirname}/public`));
// app.use(bodyParser.json());
// app.use(bodyParser.urlencoded({ extended: true }));
//

//
// app.use('/', routes);

const options = {
  dotfiles: 'ignore',
  etag: false,
  extensions: ['htm', 'html'],
  index: false,
  maxAge: '1d',
  redirect: false,
  setHeaders(res, path, stat) {
    res.set('x-timestamp', Date.now());
  },
};

app.use(express.static('public', options));

const server = app.listen(process.env.PORT || 4000, () => {
  console.log(
    'Express server listening on port %d in %s mode',
    server.address().port,
    app.settings.env,
  );
  console.log(app.settings.env);
});
