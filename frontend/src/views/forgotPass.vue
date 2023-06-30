<template>
    <div class="bg-slate-900 w-full h-screen px-[5%]">
        <div class="w-full h-full flex justify-center items-center ">
            <div class="px-[5%] py-[5%] bg-slate-950  rounded-3xl">
                <div class="w-full p-5">
                    <h1 class="text-white text-center font-bold text-2xl border-b border-white mb-5 pb-5">kirim link perubahan sandi</h1>
                    <div :class="hidden?'hidden':''"  class="w-full h-10  text-white rounded-lg mb-5 ">
                       <div class="w-full h-10 px-2 py-2 flex rounded-lg" :class="success?'bg-green-800':'bg-red-800'">
                        <svg v-if="success" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m0-10.036A11.959 11.959 0 013.598 6 11.99 11.99 0 003 9.75c0 5.592 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.31-.21-2.57-.598-3.75h-.152c-3.196 0-6.1-1.249-8.25-3.286zm0 13.036h.008v.008H12v-.008z" />
                        </svg>
                       

                        <h1 class="ml-3"> {{ message }} </h1>

                       </div>

                     </div> 
                    
                    <p class="text-white mb-2 pl-3 font-bold">Email</p>
                    <input
                    v-model="login.email"
                  class="text-slate-500 w-full rounded-full text-lg py-2 px-5 border-b border-gray-300 focus:outline-none focus:border-blue-500"
                  type="email"
                  placeholder="mike@gmail.com"
                />
                <button v-on:click="handleLoginUser()" class="w-full hover:bg-blue-800 hover:text-yellow-400 rounded-full bg-blue-600 px-5 py-3 mt-12 text-white font-bold">Kirim</button>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
export default {
    name:'forgotpassword',
    data() {
        return {
            login:{
                email:''
            },
            message:'',
            hidden:true,
            success:false,
        }
    },
    methods: {
        handleLoginUser() {
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_FORGOT
        console.log(endpoint)
        let data =  this.login
        fetch(baseURL+endpoint, {
          method: "POST",
          credentials:'include',
          headers: {
            'Bypass-Tunnel-Reminder': 'true',
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
          body:JSON.stringify(data)
        })
          .then((res) => res.json())
          .then((res) =>{
            // console.log(res.data)
             if(res.status === "OK") {
                this.message = res.message
                this.hidden = false
                this.success = true
                setTimeout(async()=> {
                    this.hidden =true
                 },1500)

             } else {
                this.message = res.message
                this.hidden = false
                this.success = false
                setTimeout(async()=> {
                    this.hidden =true 
                },3000)
             }
          }) 
         

        }
    }
}
</script>