const models = require('../models/index')
const security =  require('../config/salt')
const getAllUser = async (req,res) => {
    try{

        const users = await models.users.findAll({})
        if(users.length !== 0) {
            res.status(200).send({
                status:'OK',
                message: '',
                data:users
            })
        } else {
            res.status(404).send({
                status: 'ERROR',
                message: 'EMPTY',
                data: {}
            })
        }

    }catch(err){
         console.log(err)
         res.status(400).send({
            status:'ERROR',
            message:'',
            data: {}
         })
    }
}
const emailCanUse = async(email)=> {
    try {
      const emailinDb = await models.users.findAll({
        where: {
            email : email
        }
      })
      if(emailinDb.length == 0) return true
      
      return false
     
    }catch(err){
        console.log(err)
    }
}
const registerUser = async (req,res) => {
    try{
       
        const {fullname,email,password,phone,instansi} = await req.body;
        const level = 1
        let encryptPass = await security.encrypt(password)
        const checkemail = await emailCanUse(email)
        console.log(checkemail)
        if(checkemail == false) return res.status(400).send({
            status: 'ERROR',
            message: 'Email sudah terdaftar',
            data: {}
        })
        console.log(encryptPass)
        const users = await models.users.create({
            fullname,email,password: encryptPass,phone,instansi,level
        })

        if(users) {
            res.status(201).send({
                status: 'OK',
                message: 'Registrasi Berhasil',
            })
        } 
    }catch(err) {
        console.log(err)
        res.status(400).send({
            status: 'ERROR',
            message: 'Registrasi Gagal',
 
        })
    }
}

module.exports = { getAllUser, registerUser}