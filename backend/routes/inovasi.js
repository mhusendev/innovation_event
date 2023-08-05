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
router.get('/tema',middleware.authorization,temaInovasi.getALL);
router.get('/get_acc',inovasi.getAll_acc)
router.get('/getbyuser',inovasi.getByuser)
// post
router.post('/tahapan',tahapanInovasi.create);
router.post('/inisiator',inisiatorInovasi.create);
router.post('/jenis_inovasi',jenisInovasi.create);
router.post('/bentuk_inovasi',bentukInovasi.create);
router.post('/inovasi_covid',inovasiCovid.create);
router.post('/jenis_urusan',jenisUrusan.create);
router.post('/tema',temaInovasi.create);
// deleyte
router.post('/tahapan/d',tahapanInovasi.destroy);
router.post('/inisiator/d',inisiatorInovasi.destroy);
router.post('/jenis_inovasi/d',jenisInovasi.destroy);
router.post('/bentuk_inovasi/d',bentukInovasi.destroy);
router.post('/inovasi_covid/d',inovasiCovid.destroy);
router.post('/jenis_urusan/d',jenisUrusan.destroy);
router.post('/tema/d',temaInovasi.create);
router.post('/acc_inovasi',middleware.authorization,inovasi.accInovasi)
router.post('/reject_inovasi',middleware.authorization,inovasi.rejectInovasi)
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
    limits: { fileSize: 1000000000 },
    fileFilter: (req, file, cb) => {
        checkFileType(file, cb);
      },
  });
router.post("/submitdata", middleware.authorization,upload.array('files'),uploadController.upload)
module.exports = router;
