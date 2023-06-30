const sequelize = require("sequelize");
const db = require("../config/config");
var contact = db.define(
    "contact",
    {
       telp: {
          type: sequelize.STRING,
        },
        email: {
            type: sequelize.STRING,
          },
          alamat: {
            type: sequelize.TEXT,
          }
          
          
        
      
    },
    {
        // freeze name table not using *s on name
        freezeTableName: true,
        // dont use createdAt/update
        timestamps: false,
    }
);
module.exports = contact;
