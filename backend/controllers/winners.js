const models = require('../models/index')

const cekNilai = async (nama_inovasi) => {
    try {
        const data = await models.winners.findAll({
          where: {
              nama_inovasi : nama_inovasi
          }
        })
        if(data.length == 0) return true
        
        return false
       
      }catch(err){
          console.log(err)
      }
}
const create = async (req,res) =>{
   try{
     const {nama_inovasi,nm_perangkat_daerah,nilai,tanggal_inovasi} = req.body
      
      let cekdata = await cekNilai(nama_inovasi)

      if(cekdata) {
      
     let insert = await models.winners.create(
        {nama_inovasi,nm_perangkat_daerah,nilai,tanggal_inovasi}
        )
        if(insert) {
            res.status(201).send({
                status:'OK',
                message:'Insert Success'
            })
        }else {
            res.status(400).send({
                status:'FAILED',
                message:'Insert Failed'
            })
        }
      } else {
        res.status(400).send({
            status:'FAILED',
            message:'Inovasi sudah diberi nilai'
        })
      }

    }catch(err){
        console.log(err)
        res.status(400).send({
            status:'FAILED',
            message:'Insert Failed'
        })
    }
}

const getAll = async(req,res)=> {
    try{
        let data = await models.winners.findAll( {
            order: [
                ['nilai', 'DESC'],
            ],
        })
        if(data){
            res.status(200).send({
                status:'OK',
                message:'get all data',
                data:data
            })
        }else {
            res.status(200).send({
                status:'OK',
                message:'No data',
                data:data
            })
        }

    }catch(err){
        console.log(err)
    }
}

const update = async(req,res)=> {
    try{
      const {id,nilai} = req.body
  
      let change = await models.winners.update({nilai:nilai},{where: {id:id}})
     if(change){
      res.status(201).send({
        status:'OK',
        message:'Success'
      })
     }else {
      res.status(400).send({
        status:'ERR',
        message:'Failed'
      })
     }
    }catch(err){
      console.log(err)
    }
  } 
  const destroy = async(req,res)=> {
    try{
      const {id} = req.body
      let deleteData = await models.winners.destroy({
        where: {
            id:id
        }
      })
      if(deleteData){
        res.status(200).send({
          status:'OK',
          message:'Success'
        })
      }else {
        res.status(400).send({
          status:'ERR',
          message:'Failed'
        })
      }
    }catch(err){
      console.log(err)
    }
  }
module.exports = {
    create,
    getAll,
    update,
    destroy
}

