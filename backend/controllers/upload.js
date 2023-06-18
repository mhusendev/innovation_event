const { v4: uuidv4 } = require('uuid');
const models = require('../models')

const upload = async (req,res)=> {

   try{
    // console.log(req.body)
    let exe = []
    let nodokumen = uuidv4()
    for(let i in req.files) {
        if(req.files[i].originalname === req.body.namafile[i]) {
            
            const create = await models.docs.create({
                no_dokumentasi:nodokumen,
                url_dokumen: req.files[i].path.replace(/\\/g, "/").replace("public/","")
                ,jenis_docs: req.body.jenisfile[i]
            })
            if(create) {
                exe.push(true)
            } else { exe.push(false) }
            
        } else {
            // console.log({
            //     name: req.files[i].originalname,
            //     jenis: req.body.jenisfile
            // })
        }
     }
    const {
        email_user,nama_inovasi,inovator,nama_perangkat_daerah,tahapan,
        inisiator,jenis,bentuk,inovasi_thdp_covid,jenis_urusan_inovasi,
        tema,tanggal,no_dokumentasi,keterangan,acc,acc_by
     } = req.body
    console.log(req.body)
    if(exe.includes(false)) {
        console.log(exe)
        res.send({status:'fail'})
    } else {
 
           const data =  models.innovations.create({
            email_user:req.email,
            nama_inovasi,inovator,
            nama_perangkat_daerah,tahapan,
            inisiator,jenis,bentuk,inovasi_thdp_covid,
            jenis_urusan_inovasi,tema,tanggal,
            no_dokumentasi:nodokumen,keterangan,acc:false,acc_by:''
           })
           if(data) {
            res.status(201).send({
                status: 'OK',
                message: 'Submit Berhasil',
            })
           } 
           else {
            console.log('gagal')
            res.status(400).send({
                status: 'ERROR',
                message: 'Submit Gagal',
            })
        }
    }
     
   }catch(err) {
    console.log(err)
   } 
}

module.exports = {upload}