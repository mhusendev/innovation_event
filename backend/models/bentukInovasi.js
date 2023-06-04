const sequelize = require("sequelize");
const db = require("../config/config");
var bentuk_inovasi = db.define(
    "bentuk_inovasi",
    {
       nama: {
          type: sequelize.STRING,
          allowNull:false,
        }
      
    },
    {
        // freeze name table not using *s on name
        freezeTableName: true,
        // dont use createdAt/update
        timestamps: false,
    }
);
module.exports = bentuk_inovasi;
