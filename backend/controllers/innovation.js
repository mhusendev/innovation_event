const models = require('../models/index')
const { v4: uuidv4 } = require('uuid');

const getNo_dokumentasi = async(req,res)=> {
   let no_dokumentasi= await uuidv4()
   if(no_dokumentasi) return res.status(200).send({no_doc:no_dokumentasi})
   res.status(400).send({
    status:'ERR',
    message:'Failed to generate no dokumentasi'
   })
}


const getAll =  async (req,res)=> {

  await models.innovations.hasMany(models.docs,{foreignKey:'no_dokumentasi',sourceKey:'no_dokumentasi'})
  await models.docs.belongsTo(models.innovations,{foreignKey:'no_dokumentasi'})
  let data = await models.innovations.findAll({
    include:[{
        model:models.docs,
        
        required:true
    }]
  })
  res.send(data)

}

const getAll_acc =  async (req,res) => {
    try{
        await models.innovations.hasMany(models.docs,{foreignKey:'no_dokumentasi', sourceKey:'no_dokumentasi'})
        await models.docs.belongsTo(models.innovations,{foreignKey:'no_dokumentasi'})
        let data = await models.innovations.findAll({
            include:[{
                model:models.docs,
                required:true
            }],
            where: {acc:'sudah'},
            order: [
                ['id', 'DESC'],
            ]
        },
        )
    
        res.send(data)
    }catch(err){
        console.log(err)
    }
}
const accInovasi = async (req,res)=> {

  try{
    let update = models.innovations.update({
        acc: 'sudah',
        act_by:req.email
   },
    {
        where: {
            id:req.body.id
        }
    }
   )

   if(update) {
       res.status(200).send({
        status: 'OK',
        message:'Inovasi Berhasil di Update',
       })
   } else {
    res.status(400).send({
        status: 'ERROR',
        message:'Inovasi gagal di Update',
       })
   }
  }catch(err){
    console.log(err)
  }
}
const rejectInovasi = async (req,res)=> {

    try{
      let update = models.innovations.update({
          acc: 'rejected',
          act_by:req.email
     },
      {
          where: {
              id:req.body.id
          }
      }
     )
  
     if(update) {
         res.status(200).send({
          status: 'OK',
          message:'Inovasi Berhasil di Update',
         })
     } else {
      res.status(400).send({
          status: 'ERROR',
          message:'Inovasi gagal di Update',
         })
     }
    }catch(err){
      console.log(err)
    }
  }
  
const create = async (req,res)=> {
try {
   const {
    nama_inovasi,
    inovator,
    nama_perangkat_daerah,
    tahapan,inisiator,jenis,
    bentuk,inovasi_thdp_covid,
    jenis_urusan_inovasi,tema,tanggal,
    no_dokumentasi,keterangan,acc,acc_by
   } = req.body
   const data = await models.innovations.create({
    nama_inovasi,inovator,
    surat,proposal,nama_perangkat_daerah,tahapan,
    inisiator,jenis,bentuk,inovasi_thdp_covid,
    jenis_urusan_inovasi,tema,tanggal,
    no_dokumentasi,keterangan,acc:'belum',act_by:''
   })
   if(data) {
    res.status(201).send({
        status: 'OK',
        message: 'Submit Berhasil',
    })
   } 
   else {
    res.status(400).send({
        status: 'ERROR',
        message: 'Submit Gagal',
    })
}
}catch(err) {
    console.log(err)
    res.status(400).send({
        status: 'ERROR',
        message: 'Submit Gagal',

    })
}

}

module.exports= {getNo_dokumentasi, create ,getAll, accInovasi,getAll_acc,rejectInovasi}