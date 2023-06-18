const models = require('../models/index')

const create = async (req,res)=> {

   console.log(req.file.path) 
try{
const month = ["January","February","March","April","May","June","July","August","September","October","November","December"];
const d = new Date();
let name = month[d.getMonth()];
let customtanggal = new Date().getDate()+" "+name+" "+new Date().getFullYear()    
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
        let update;
       
        if(req.file){
            let posterURl = req.file.path.replace(/\\/g, "/").replace("public/","")
            const {id,judul,deskripsi,start,end} = req.body
         update =await models.events.update({
        judul,deskripsi,poster:posterURl,edited_by:req.email,
        start,end},
        {
            where: {
                id:id
            },
        })
        } else {
           console.log(req.body)
           const {id,judul,deskripsi,start,end} = req.body
            update =await models.events.update({
            judul,deskripsi,edited_by:req.email,
            start,end},
            {
                where: {
                    id:id
                },
            })
        	}

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
        console.log(err)
    }

}

const hapus = async (req,res)=> {
    const {id} = req.body
  //  console.log(req.body)
    try{
       let deleteData = await models.events.destroy({
            where: {
                id:id
            }
        })
        if(deleteData){
            res.status(200).send({
                status:'OK',
                message:'data berhasil dihapus'
            })
        }else {
            res.status(400).send({
                status:'ERROR',
                message:'data gagal dihapus'
            })
        }
    }catch(err){
        console.log(err)
    }
}

module.exports ={create,getall,update,hapus}
