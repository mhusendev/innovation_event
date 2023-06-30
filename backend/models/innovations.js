const sequelize = require("sequelize");
const db = require("../config/config");
var innovations = db.define(
    "innovations",
    {   
        email_user:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        nama_inovasi:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        inovator:  {
            type: sequelize.STRING,
            allowNull:false,
          },

        nama_perangkat_daerah:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        tahapan:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        inisiator:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        jenis:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        bentuk:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        inovasi_thdp_covid:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        jenis_urusan_inovasi:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        tema:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        tanggal:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        no_dokumentasi:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        keterangan:  {
            type: sequelize.TEXT,
            allowNull:false,
          },
        acc:  {
            type: sequelize.STRING,
            allowNull:false,
          },
        act_by: {
            type: sequelize.STRING,
            allowNull:true,
          },
      },
    {
        // freeze name table not using *s on name
        freezeTableName: false,
        // dont use createdAt/update
        timestamps: true,
    }
);
module.exports = innovations;


