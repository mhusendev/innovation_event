var express = require('express');
var router = express.Router();
var middleware = require('../controllers/middleware')
var contact = require('../controllers/contact')

/* GET users listing. */
router.get('/list', contact.getALL);
router.post('/create', contact.create);
router.put('/update', contact.update);
router.post('/delete', contact.destroy);
module.exports = router;
