const models = require('../models/index')

const create = async (req,res)=> {

   console.log(req.file.path) 
try{
let customtanggal = new Date().getDay+"/"+new Date().getMonth()+"/"+new Date().getFullYear()    
let posterURl = req.file?req.file.path.replace(/\\/g, "/").replace("public/",""):''
const {judul,deskripsi,start,end} = req.body
const data = await models.events.create({judul,tanggal:customtanggal,deskripsi,start,end,poster:posterURl,create_by:req.email?req.email:''})
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

const getall = async(req,res)=> {
  console.log(req.query.page)
  try{
     let page = req.query.page ? parseInt(req.query.page) : false
     let limit = 1
     let data;
    if(page){
            data = await models.events.findAndCountAll({
            offset: page-1,
            limit: limit ,
          });
    } else {
        data = await models.events.findAll();
    }

      if(data) {
        res.status(200).send({
            status:'OK',
            startPage:page?page:'1-end',
            total:page?data.count:'alldata',
            data:page? data.rows : data
        })
      }

  }catch(err){
    console.log(err)
  }
}

const update = async(req,res) => {
    try{
        const {judul,tanggal,deskripsi,poster} = req.body
        let update =await models.innovations.update({
            judul,tanggal,deskripsi,poster,edited_by:req.email
        },
        {
            where: {
                id:req.body.id
            },
        })

        if(update){
            res.status(200).send({
                status:'OK',
                message:'data berhasil diupdate'
            })
        }else {
            res.status(400).send({
                status:'ERROR',
                message:'data gagal diupdate'
            })
        }
    }catch(err){
        
    }

}

module.exports ={create,getall,update}
