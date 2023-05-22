
<template>
    <div class="flex">
       <Sidebar/>
        <div class="w-full">
           <Topbar/>
           <div class="w-full px-[15%] py-[5%]">
            <h1 class="w-full p-10 text-center mt-[10%] font-bold text-2xl shadow-xl rounded-2xl text-gray-500" >Selamat datang di System Ruang Publik Inovasi Daerah</h1>
           </div>
   
   
        </div>
   
    </div>
    
   </template>
   
   <script>
   import Sidebar from '../components/Sidebar.vue';
   import Topbar from '../components/Topbar.vue';
   console.log(document.cookie)
   export default {
       name:'dashboard',
       components: { Topbar, Sidebar },
       data(){
        return {}
       },
       methods: {
        
       },
       mounted: function () {
        
       },
       created:  function() {
        let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_CEKLOGIN
        fetch(baseURL+endpoint, {
          method: "GET",
          credentials:'include',
          headers: {
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
        })
          .then((res) => {
            if(res.status !== 200) {
                this.$router.push( {name:'login'})
            }
            console.log(res.status)
          }).catch((err)=> {
            this.$router.push( {name:'login'})
          })
        

       }
   }
   
   </script>
   