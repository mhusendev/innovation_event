var express = require('express');
var router = express.Router();
var userController = require('../controllers/user')
/* GET users listing. */
router.get('/', userController.getAllUser);
router.post('/',userController.registerUser);
module.exports = router;
