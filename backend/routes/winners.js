var express = require('express');
var router = express.Router();
var middleware = require('../controllers/middleware')
var winners = require('../controllers/winners')

/* GET users listing. */
router.get('/list', winners.getAll);
router.post('/create', winners.create);
router.put('/update', winners.update);
router.post('/delete', winners.destroy);
module.exports = router;
