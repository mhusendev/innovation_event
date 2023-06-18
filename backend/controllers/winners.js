const models = require('../models/index')

const create = async (req,res) =>{
   try{
     const {nama_inovasi,nm_perangkat_daerah,nilai,tanggal_inovasi} = req.body

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
        let data = await models.winners.findAll()
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

module.exports = {
    create,
    getAll
}

