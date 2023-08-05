<template>
    <!-- component -->
<link rel="stylesheet" href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" />

<div class="min-h-screen flex flex-row bg-gray-100">
  <div class="flex flex-col w-56 bg-white  overflow-hidden">
    <div class="flex items-center justify-center h-20 ">
      <img src="../assets/img/logo.png" class="pt-12" alt="">
    </div>
    <ul class="flex flex-col py-4 mt-5">
      <li>
        <router-link to="/admin/dashboard" class="flex flex-row items-center h-12 transform hover:translate-x-2 transition-transform ease-in duration-200 text-gray-500 hover:text-gray-800">
          <span class="inline-flex items-center justify-center h-12 w-12 text-lg text-gray-400"><i class="bx bx-home"></i></span>
          <span class="text-sm font-medium">Dashboard</span>
        </router-link>
      </li>
      <li>
        <router-link to="/admin/master" class="flex flex-row items-center h-12 transform hover:translate-x-2 transition-transform ease-in duration-200 text-gray-500 hover:text-gray-800">
          <span class="inline-flex items-center justify-center h-12 w-12 text-lg text-gray-400"><i class="bx bx-box"></i></span>
          <span class="text-sm font-medium">Master</span>
        </router-link>
      </li>
      <li>
        <router-link to="/admin/event" class="flex flex-row items-center h-12 transform hover:translate-x-2 transition-transform ease-in duration-200 text-gray-500 hover:text-gray-800">
          <span class="inline-flex items-center justify-center h-12 w-12 text-lg text-gray-400"><i class="bx bx-box"></i></span>
          <span class="text-sm font-medium">Event</span>
        </router-link>
      </li>
      <li>
        <router-link to="/admin/inovasi" class="flex flex-row items-center h-12 transform hover:translate-x-2 transition-transform ease-in duration-200 text-gray-500 hover:text-gray-800">
          <span class="inline-flex items-center justify-center h-12 w-12 text-lg text-gray-400"><i class="bx bx-drink"></i></span>
          <span class="text-sm font-medium">Kumpulan Inovasi</span>
        </router-link>
      </li>
      <li>
        <router-link to="/admin/pemenang" class="flex flex-row items-center h-12 transform hover:translate-x-2 transition-transform ease-in duration-200 text-gray-500 hover:text-gray-800">
          <span class="inline-flex items-center justify-center h-12 w-12 text-lg text-gray-400"><i class="bx bx-calendar"></i></span>
          <span class="text-sm font-medium">Pemenang</span>
        </router-link>
      </li>
    
      
  
      <li>
        <button v-on:click="logout()" class="flex flex-row items-center h-12 transform hover:translate-x-2 transition-transform ease-in duration-200 text-gray-500 hover:text-gray-800">
          <span class="inline-flex items-center justify-center h-12 w-12 text-lg text-gray-400"><i class="bx bx-log-out"></i></span>
          <span class="text-sm font-medium">Logout</span>
        </button>
      </li>
    </ul>
  </div>
</div>

</template>
<script>
export default {
  name:'sidebar',
  data(){
    return{}
  },
  methods:{
    logout(){
			let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_LOGOUT
        let token = 'Bearer '+localStorage.getItem('token')
		console.log(token)
        fetch(baseURL+endpoint, {
          method: "GET",
          credentials:'include',
          headers: {
			'Authorization':token,
			'Bypass-Tunnel-Reminder': 'true',
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
        })
          .then(async (res) => {
			if(res.status == 200){
				localStorage.removeItem('token')
				alert('logout berhasil')
				window.location.href = '/'
            } else {
				alert('logout gagal')
				this.$router.push( {name:''})
            }
		  })
      
          .catch((err)=> {
            this.login = false
             console.log(err)
             
          })
		}
  }
}

</script>