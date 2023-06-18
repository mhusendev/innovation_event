var express = require('express');
var router = express.Router();
var userController = require('../controllers/user')
var middleware = require('../controllers/middleware')
var events = require('../controllers/events')
/* GET users listing. */
router.get('/', events.getall);

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
    const fileTypes = /jpeg|jpg|png/;
  
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
router.post("/create",middleware.authorization,upload.single('file'),events.create);
router.put("/update",middleware.authorization,upload.single('file'),events.update);
router.post("/hapus",middleware.authorization,events.hapus);
module.exports = router;
