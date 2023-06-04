var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var serveIndex = require('serve-index');


var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var inovasiRouter = require('./routes/inovasi');

var cors = require('cors')
var app = express();

app.use(express.static(path.join(__dirname, 'public')));
app.use('/files',serveIndex(__dirname+'/files'))

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(function(req, res, next){
  req.setTimeout(500000, function(){
      // call back function is called when request timed out.
  });
  next();
});
app.use(cors({ origin:'https://dark-papayas-pull.loca.lt', credentials: true,  preflightContinue: true, }))
// app.use(cors({ origin:true, credentials: true,  preflightContinue: true, }))
app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/inovasi',inovasiRouter)

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

// app.listen(5500,()=>{
//   console.log('server runing ')
// })


module.exports = app;
