const sequelize = require("sequelize");
const db = require("../config/config");
var tahapan = db.define(
    "tahapan_inovasi",
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
module.exports = tahapan;
