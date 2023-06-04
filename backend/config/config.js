
var sequelize = require("sequelize");
var db = new sequelize(
    "db_inovasi",
    "root",
    "",
    {
        dialect: "mysql",
        dialectModule: require('mysql2'),
        host: 'localhost',
    }
);
module.exports = db;