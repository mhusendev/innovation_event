const models = require('../models')

const getALL = async (req,res)=> {
try{
  let data = await models.jenisInovasi.findAll({})
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

module.exports = { getALL}