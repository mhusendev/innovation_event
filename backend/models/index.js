const users = require("./users");
const innovations = require('./innovations')
const tahapan_inovasi = require('./tahapanInovasi')
const inisiator_inovasi = require('./inisiatorInovasi')
const jenisInovasi = require('./jenis')
const bentukInovasi = require('./bentukInovasi')
const inovasiCovid = require('./inovasiCovid')
const jenisUrusan = require('./jenisUrusan')
const temaInovasi = require('./temaInovasi')
const winners = require('./winners')
const docs = require('./docs')
const events=  require('./events')
const contact = require('./contact')
const model = {};
model.users = users;
model.innovations = innovations
model.tahapan_inovasi = tahapan_inovasi
model.inisiator_inovasi = inisiator_inovasi
model.jenisInovasi = jenisInovasi
model.bentukInovasi = bentukInovasi
model.inovasiCovid =inovasiCovid
model.jenisUrusan = jenisUrusan
model.temaInovasi = temaInovasi
model.docs = docs
model.contact = contact
model.events = events
model.winners = winners
module.exports = model;
