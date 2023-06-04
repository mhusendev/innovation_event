var express = require('express');
var router = express.Router();
var middleware = require('../controllers/middleware')
var tahapanInovasi =  require('../controllers/tahapanInovasi');
var inisiatorInovasi = require('../controllers/inisiatorInovasi')
var jenisInovasi = require('../controllers/jenisInovasi')
var bentukInovasi = require('../controllers/bentukInovasi')
var inovasiCovid = require('../controllers/inovasiCovid')
var jenisUrusan = require('../controllers/jenisUrusan')
var temaInovasi = require('../controllers/temaInovasi')
var uploadController = require('../controllers/upload')
var inovasi = require('../controllers/innovation')
router.get('/',inovasi.getAll)
router.get('/tahapan', tahapanInovasi.getALL);
router.get('/inisiator',inisiatorInovasi.getALL);
router.get('/jenis_inovasi',jenisInovasi.getALL);
router.get('/bentuk_inovasi', bentukInovasi.getALL);
router.get('/inovasi_covid',inovasiCovid.getALL);
router.get('/jenis_urusan', jenisUrusan.getALL);
router.get('/tema',temaInovasi.getALL);
router.post('/acc_inovasi',middleware.authorization,inovasi.accInovasi)
// multer
const multer = require('multer');
const storageEngine = multer.diskStorage({
    destination: "./file",
    filename: (req, file, cb) => {
      cb(null, `${Date.now()}--${file.originalname}`);
    },
  });

  const path = require("path");

  const checkFileType = function (file, cb) {
    //Allowed file extensions
    const fileTypes = /jpeg|jpg|png|mp4|pdf|docx|mkv/;
  
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
router.post("/uploads",middleware.authorization, uploadController.upload)
module.exports = router;
