const models = require('../models/index')
const security =  require('../config/salt')
const SECRET_KEY = "Kmzway87@@";
const jwt = require('jsonwebtoken')
const mailer = require('../config/mailer')
let url ="http://localhost:3000"
let stringvalid = '';
let mailsave='';
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

const getUserbytoken = async (req,res) => {
    const authHeader =await req.headers['authorization']?req.headers['authorization'] :''

    const token_header =await authHeader && authHeader.split(' ')[1]
      const token = req.cookies.token ? req.cookies.token : token_header
    if(!token) {
        return res.status(401).send({
            status:'ERROR',
            message:'Permission Denied'
        })
        }
    
        try{
           const data = jwt.verify(token,SECRET_KEY)
         
            if(data) {
              return res.status(200).send(data)
            }
            return res.status(401).send({
                status:'ERROR',
                message:'Invalid token'
            })
        }catch(error) {
            console.log(error)
            return res.status(400).send({
                status:'ERROR',
                message:'Request not send'
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

const updatePassword = async(req,res) => {
    try{
        const {newpass} = await req.body
        let encryptPass = await security.encrypt(newpass)
        let change = await models.users.update({password:encryptPass},{where: {email:mailsave}})
        if(change){
            mailsave =''
         res.status(200).send({
           status:'OK',
           message:'Success'
         })
        } else {
            mailsave =''
         res.status(200).send({
           status:'ERR',
           message:'Failed'
         })
        }

    }catch(err){
        console.log(err)
        mailsave =''
        res.status(200).send({
            status:'ERR',
            message:'Failed'
          })

    }
}
const verifyLink =async (req,res) => {
  try{
    if(req.query.t == stringvalid){
        res.render('new')
        setTimeout(()=>{
            stringvalid =''
        },100000)
    }else {
        res.render('index')
    }
  }catch(err){
    console.log(err)
  }
}
const sendMailVerify = async(req,res)=> {
    try{ 
        let checkemail = await emailCanUse(req.body.email)
        if(checkemail) return res.status(400).send({
            status: 'ERROR',
            message: 'Email tidak terdaftar',
            data: {}
        })
         stringvalid =  makeid(50)
         mailsave = req.body.email
         let urlview =url +'/users/?t='+stringvalid
         let text = `<p>Ubah password dengan klik link dibawah <br> 
                      <a href=${urlview}>klik disini</a>
                        </p>`
         let send = mailer.sendEmail(req.body.email,'mengganti password',text)
         if(send) {
            res.status(200).send({
                status:'OK',
                message:'Akun ditemukan ,Link sudah dikirim ke email'
              })
         } else {
            res.status(400).send({
                status:'ERR',
                message:'Failed'
              })
         }
    }catch(err){
        console.log(err)
        res.status(400).send({
            status:'ERR',
            message:'Failed'
          })
    }
}
const registerUser = async (req,res) => {
if(req.body.fullname !== '' || req.body.email !== '' || req.body.phone !== '' || req.body.instansi !== ''){
    try{
       
        const {fullname,email,password,phone,instansi} = await req.body;
        const level = req.headers.admin?1:0
        let encryptPass = await security.encrypt(password)
        let checkemail = await emailCanUse(email)
        console.log(checkemail)
        if(checkemail == false) return res.status(400).send({
            status: 'ERROR',
            message: 'Email sudah terdaftar',
            data: {}
        })

        const users = await models.users.create({
            fullname,email,password: encryptPass,phone,instansi,level
        })

        if(users) {
            res.status(201).send({
                status: 'OK',
                message: 'Registrasi Berhasil',
            })
        }  else {
            res.status(400).send({
                status: 'ERROR',
                message: 'Registrasi Gagal',
            })
        }
    }catch(err) {
        console.log(err)
        res.status(400).send({
            status: 'ERROR',
            message: 'Registrasi Gagal',
 
        })
    }
} else {
    res.status(400).send({
        status: 'ERROR',
        message: 'Registrasi Gagal',
    })
}
}


// lib
function makeid(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    let counter = 0;
    while (counter < length) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
      counter += 1;
    }
    return result;
}

module.exports = { 
    getAllUser, 
    registerUser,
    getUserbytoken,
    sendMailVerify,
    verifyLink,
    updatePassword
}