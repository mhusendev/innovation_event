const sequelize = require("sequelize");
const db = require("../config/config");
var winners = db.define(
    "winners",
    {
      
        nama_inovasi: {
             type: sequelize.STRING,
             allowNull:false,
         },
        nm_perangkat_daerah: {
          type: sequelize.STRING,
          allowNull:false,
          
        },
        nilai: {
          type: sequelize.STRING,
          allowNull:false,
        },
        tanggal_inovasi: { type: sequelize.STRING,
            allowNull:false },
            event: { type: sequelize.STRING,
              allowNull:false },
        
      
    },
    
    {
        // freeze name table not using *s on name
        freezeTableName: false,
        // dont use createdAt/update
        timestamps: false,
    }
);
module.exports = winners;
