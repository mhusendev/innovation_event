var express = require('express');
var router = express.Router();
var userController = require('../controllers/user')
var middleware = require('../controllers/middleware')
var innovations = require('../controllers/innovation')
var uploadController = require('../controllers/upload')
/* GET users listing. */
router.get('/myinfo', userController.getUserbytoken);
router.post('/register',userController.registerUser)
router.post('/login',middleware.authentication)
router.get('/logout',middleware.logout)
router.get('/isloggedin',middleware.authorization,(req,res)=> {
    console.log(req.admin)
    res.status(200).send({ status:200,isAdmin:req.admin })
})
router.get('/logout', middleware.authorization,(req,res)=> {
    return res
    .clearCookie("token")
    .status(200)
    .json({ message: "Successfully logged out 😏 🍀" });
})

// multer
const multer = require('multer');
const storageEngine = multer.diskStorage({
    destination: "./public/files",
    filename: (req, file, cb) => {
      cb(null, `${Date.now()}--${file.originalname}`);
    },
  });

  const path = require("path");

  const checkFileType = function (file, cb) {
    //Allowed file extensions
    const fileTypes = /jpeg|jpg|png|mp4|pdf|mkv/;
  
    //check extension names
    const extName = fileTypes.test(path.extname(file.originalname).toLowerCase());
  
    const mimeType = fileTypes.test(file.mimetype);
  
    if (mimeType && extName) {
      return cb(null, true);
    } else {
      cb("Error: ext tidak diizinkan !!");
    }
  };
  
  const upload = multer({
    storage: storageEngine,
    limits: { fileSize: 100000000 },
    fileFilter: (req, file, cb) => {
        checkFileType(file, cb);
      },
  });
router.post("/uploads",middleware.authorization,upload.array('files'),uploadController.upload)

module.exports = router;
