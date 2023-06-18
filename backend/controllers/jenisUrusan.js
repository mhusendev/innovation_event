const models = require('../models')

const getALL = async (req,res)=> {
try{
  let data = await models.jenisUrusan.findAll({})
  if(data) {
    res.status(200).send(data)
  }else {
    res.sendStatus(400)
  }
  

}catch(err) {
    console.log(err)
    res.sendStatus(400)
}

}

const create =async (req,res)=> {
  try{
    const {nama}= req.body
     let post = await models.jenisUrusan.create({nama})
     if(post){
      res.status(201).send({
        status:'OK',
        message:'Success'
      })
     } else {
      res.status(400).send({
        status:'ERROR',
        message:'Failed'
      })
     }

  }catch(err){
    res.status(400).send({
      status:'ERROR',
      message:'Failed'
    })
    console.log(err)
  }
}

const update = async(req,res)=> {
  try{
    const {id,nama} = req.body

    let change = await models.jenisUrusan.update({nama},{where: {id:id}})
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
    let deleteData = await models.jenisUrusan.destroy({id})
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
module.exports = { getALL , create, update, destroy}