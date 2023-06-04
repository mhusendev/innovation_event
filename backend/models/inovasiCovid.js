const sequelize = require("sequelize");
const db = require("../config/config");
var inovasi_covid = db.define(
    "inovasi_covid",
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
module.exports = inovasi_covid;
