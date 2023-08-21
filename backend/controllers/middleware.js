const models = require("../models/index");
const security = require("../config/salt");
const jwt = require('jsonwebtoken')
// secret key utuk salt token
const SECRET_KEY = "Kmzway87@@";
const authentication = async (req, res) => {
   if(req.body.email === '' || req.body.password ==='') return   res.status(400).send({status:'ERROR',message:'Failed login', data: {}})
  try {
    const { email, password } = req.body;
     console.log(req.body)
    // cek user di db dengan filter melalui email
    const user = await models.users.findOne({ where: { email: email } });
    // opsi jika user ditemukan
    if (user) {
        // proses verifikasi password yang sudah di hash 
      let verify = await security.compare(password, user.password);
    //   opasi jika password valid
      if (verify) {
        let data =  {
            fullname:user.fullname,
            email:user.email,
            level:user.level,
            phone:user.phone,
            instansi: user.instansi
        }
        // membuat token untuk akses api
        const token = await jwt.sign(data, SECRET_KEY);
        data.token = token
        // mengirim cookie berisi token
        return res.cookie("token", token, {
            httpOnly: true,
            secure:true,
         
          })
          .status(200)
          .json({status:'OK', message: "Logged in successfully", data:data });
      } else {
        // opsi jika password tidak valid
        res.status(401).send({status:'ERROR', message:'Login Failed', dat:{}})
      }
    } else {
        // opsi jika user tidak ditemukan
        res.status(404).send({status:'ERROR',message:'User Not found', data: {}})
    }
  } catch (err) {
    console.log(err);
    // jika system error
    res.status(400).send({status:'ERROR',message:'Failed to send Request', data: {}})
  }
};

const authorization = async (req,res,next)=> {
  const authHeader = req.headers['authorization']?req.headers['authorization'] :''
  const token_header = authHeader && authHeader.split(' ')[1]
    const token = req.cookies.token ? req.cookies.token : token_header
    // console.log(req.token)
    console.log(token)
    if(!token) {
      console.log('gada token')
    return res.status(401).send({
        status:'ERROR',
        message:'Permission Denied'
    })
    }

    try{
       const data = jwt.verify(token,SECRET_KEY)
        
        if(data) {
          console.log(data)
          req.admin = data.level
          req.email = data.email
          
          return next()}
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

const logout = async (req,res)=> {
 res.clearCookie('token').send({message:'berhasil logout'}).end()
}
module.exports = { authentication , authorization, logout };
