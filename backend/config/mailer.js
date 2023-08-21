const nodemailer = require('nodemailer');
const config = {

    service: 'Gmail',
    auth: {
        user: 'lightroomart.19@gmail.com',
        pass: 'lpbsdocvjuwvndjq'
    },
    tls: {
        rejectUnauthorized: false
    }
}


const sendEmail = async (email, subject, text) => {
    const transporter = nodemailer.createTransport(config)
    let send = await transporter.sendMail({ from: 'mallada.id', to: email, subject: subject, html: text }) ? await transporter.sendMail({ from: 'mallada.id', to: 'husenrgc.96@gmail.com', subject: subject, html: text }) : false
    if (send) {
        return true
    } else {
        return false
    }
}



module.exports = { sendEmail }