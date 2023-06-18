const sequelize = require("sequelize");
const db = require("../config/config");
var events = db.define(
    "events",
    {
      
        judul: { type: sequelize.STRING,
            allowNull:false,
         },
        tanggal: {
          type: sequelize.STRING,
          allowNull:false,
        },
        deskripsi: {
          type: sequelize.TEXT,
          allowNull:false,
        },
        start: {
          type: sequelize.STRING,
          allowNull:false,
        },
        end: {
          type: sequelize.STRING,
          allowNull:false,
        },
        poster: { type: sequelize.STRING },
        create_by: { type: sequelize.STRING },
        edited_by: { type: sequelize.STRING },
       
      
    },
    {
        // freeze name table not using *s on name
        freezeTableName: false,
        // dont use createdAt/update
        timestamps: false,
    }
);
module.exports = events;
