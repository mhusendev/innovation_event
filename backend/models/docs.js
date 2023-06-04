const sequelize = require("sequelize");
const db = require("../config/config");
var docs = db.define(
    "docs",
    {
       no_dokumentasi: {
          type: sequelize.STRING,
          allowNull:false,
        },
        url_dokumen: {
            type: sequelize.STRING,
            allowNull:false,
          },
          jenis_docs: {
            type: sequelize.STRING,
            allowNull:false,
          }
      
    },
    {
        // freeze name table not using *s on name
        freezeTableName: false,
        // dont use createdAt/update
        timestamps: true,
    }
);
module.exports = docs;
