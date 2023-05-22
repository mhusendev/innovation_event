var express = require('express');
var router = express.Router();
var userController = require('../controllers/user')
var middleware = require('../controllers/middleware')
/* GET users listing. */
router.get('/', userController.getAllUser);
router.post('/',userController.registerUser);
router.post('/login',middleware.authentication)
router.get('/isloggedin',middleware.authorization,(req,res)=> { res.sendStatus(200)})
router.get('/logout', middleware.authorization,(req,res)=> {
    return res
    .clearCookie("token")
    .status(200)
    .json({ message: "Successfully logged out 😏 🍀" });
})
module.exports = router;
