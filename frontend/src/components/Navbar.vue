<template>
    <div>
        <nav class="relative px-10 py-1 flex justify-between items-center bg-slate-900">
	
			<img src="../assets/img/logo2.png" class="w-[10%] "/>
        
<!-- <button id="dropdownDefaultButton" data-dropdown-toggle="dropdown" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-4 py-2.5 text-center inline-flex items-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">Dropdown button <svg class="w-4 h-4 ml-2" aria-hidden="true" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg></button> -->
<!-- Dropdown menu -->


		
		<div class="lg:hidden">
			<button v-on:click="isShow = true" class="navbar-burger flex items-center text-blue-600 p-3">
				<svg class="block h-4 w-4 fill-current" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
					<title>Mobile menu</title>
					<path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"></path>
				</svg>
			</button>
		</div>
		<ul  class="hidden absolute top-1/2 left-1/2 transform -translate-y-1/2 -translate-x-1/2 lg:flex lg:mx-auto lg:flex lg:items-center lg:w-auto lg:space-x-6">
			<li v-for="(page,index) in pages" class="flex"> 
                <router-link :class="page.active?'text-blue-600 font-bold':'text-white'" class="text-sm  hover:text-gray-500" :to="page.link">{{page.name}}</router-link>
                 <div class="text-gray-300 mt-1 ml-5" v-if="index < (pages.length-1)">
                    <svg xmlns="http://www.w3.org/2000/svg"  fill="none" stroke="currentColor" class="w-4 h-4 current-fill" viewBox="0 0 24 24">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v0m0 7v0m0 7v0m0-13a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
				   </svg>
                 </div>
               
            </li>
			<li >
				
			</li>
		
        </ul>
		<div :class="login?'hidden':'hidden lg:block md:block'">
			<a class="hidden lg:inline-block lg:ml-auto lg:mr-3 py-2 px-6 bg-gray-50 hover:bg-gray-100 text-sm text-gray-900 font-bold  rounded-xl transition duration-200" href="/login">Sign In</a>
		    <a class="hidden lg:inline-block py-2 px-6 bg-blue-500 hover:bg-blue-600 text-sm text-white font-bold rounded-xl transition duration-200" href="/register">Sign up</a>
		</div>
       <div :class="login?'hidden lg:flex md:lfex':'hidden'" class="flex" >
		<h1 class="mr-2 bg-white rounded-full px-2 py-2 font-bold text-sm">{{ datauser?.email  }}</h1>
            <!-- <img src="../assets/img/user.png"  class="w-10 h-10 rounded-full" alt=""> -->
	         <button id="dropdownDefaultButton" data-dropdown-toggle="dropdown" class="bg-user bg-cover w-10 h-10 rounded-full  focus:ring-4 focus:outline-none  font-medium  text-sm  text-center inline-flex items-center" type="button"></button>
			<!-- dropdown -->
			<div id="dropdown" class="z-10 mr-[5%] hidden bg-white divide-y divide-gray-100 rounded-lg shadow w-44 dark:bg-gray-700">
				<ul class="py-2 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="dropdownDefaultButton">
				<li>
					<button v-on:click="showProfile()" :class="(title === 'Profile')?'text-blue-600':''" class="w-full text-left block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Profile</button>
				</li>
				<li>
					<a href="/inovasiku" :class="(title === 'Pengajuan')?'text-blue-600':''" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Inovasi ku</a>
				</li>
				<li>
					<a href="/pengajuan-inovasi" :class="(title === 'Pengajuan')?'text-blue-600':''" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Pengajuan Inovasi</a>
				</li>
				<li>
					<button v-on:click="logout()" class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white w-full text-left">Sign out</button>
				</li>
				</ul>
			</div>
			<!-- dropdown -->
		</div> 

	</nav>
	<div class=" relative  transition-transform delay-300 duration-1000 " :class="isShow?'z-50':'z-0 w-0 h-0'">
		<div :class="isShow?'block':'w-0 h-0'" class="navbar-backdrop fixed inset-0 bg-gray-800 opacity-25"></div>
		<nav :class="isShow?'fixed max-w-sm top-0 left-0 bottom-0 flex flex-col w-5/6  py-6 px-6 bg-slate-900 border-r overflow-y-auto':'w-0 h-0'" class=" ">
			<div :class="isShow?'flex':'hidden'" class=" items-center mb-8">
				<a :class="isShow?'block':'hidden'" class="mr-auto text-3xl font-bold leading-none" href="#">
					<!-- <svg class="h-12" alt="logo" viewBox="0 0 10240 10240">
				        <path xmlns="http://www.w3.org/2000/svg" d="M8284 9162 c-2 -207 -55 -427 -161 -667 -147 -333 -404 -644 -733 -886 -81 -59 -247 -169 -256 -169 -3 0 -18 -9 -34 -20 -26 -19 -344 -180 -354 -180 -3 0 -29 -11 -58 -24 -227 -101 -642 -225 -973 -290 -125 -25 -397 -70 -480 -80 -22 -3 -76 -9 -120 -15 -100 -13 -142 -17 -357 -36 -29 -2 -98 -7 -153 -10 -267 -15 -436 -28 -525 -40 -14 -2 -45 -7 -70 -10 -59 -8 -99 -14 -130 -20 -14 -3 -41 -7 -60 -11 -19 -3 -39 -7 -45 -8 -5 -2 -28 -6 -50 -10 -234 -45 -617 -165 -822 -257 -23 -10 -45 -19 -48 -19 -7 0 -284 -138 -340 -170 -631 -355 -1107 -842 -1402 -1432 -159 -320 -251 -633 -308 -1056 -26 -190 -27 -635 -1 -832 3 -19 7 -59 10 -89 4 -30 11 -84 17 -120 6 -36 12 -77 14 -91 7 -43 33 -174 39 -190 3 -8 7 -28 9 -45 6 -35 52 -221 72 -285 7 -25 23 -79 35 -120 29 -99 118 -283 189 -389 67 -103 203 -244 286 -298 75 -49 178 -103 196 -103 16 0 27 16 77 110 124 231 304 529 485 800 82 124 153 227 157 230 3 3 28 36 54 74 116 167 384 497 546 671 148 160 448 450 560 542 14 12 54 45 90 75 88 73 219 172 313 238 42 29 77 57 77 62 0 5 -13 34 -29 66 -69 137 -149 405 -181 602 -7 41 -14 82 -15 90 -1 8 -6 46 -10 83 -3 37 -8 77 -10 88 -2 11 -7 65 -11 122 -3 56 -8 104 -9 107 -2 3 0 12 5 19 6 10 10 8 15 -10 10 -34 167 -346 228 -454 118 -210 319 -515 340 -515 4 0 40 18 80 40 230 128 521 255 787 343 118 40 336 102 395 113 28 5 53 11 105 23 25 5 59 12 75 15 17 3 41 8 55 11 34 7 274 43 335 50 152 18 372 29 565 29 194 0 481 -11 489 -19 2 -3 -3 -6 -12 -6 -9 -1 -20 -2 -24 -3 -33 -8 -73 -16 -98 -21 -61 -10 -264 -56 -390 -90 -649 -170 -1243 -437 -1770 -794 -60 -41 -121 -82 -134 -93 l-24 -18 124 -59 c109 -52 282 -116 404 -149 92 -26 192 -51 220 -55 17 -3 64 -12 105 -21 71 -14 151 -28 230 -41 19 -3 46 -7 60 -10 14 -2 45 -7 70 -10 25 -4 56 -8 70 -10 14 -2 53 -7 88 -10 35 -4 71 -8 81 -10 10 -2 51 -6 92 -9 101 -9 141 -14 147 -21 3 -3 -15 -5 -39 -6 -24 0 -52 -2 -62 -4 -21 -4 -139 -12 -307 -22 -242 -14 -700 -7 -880 13 -41 4 -187 27 -250 39 -125 23 -274 68 -373 111 -43 19 -81 34 -86 34 -4 0 -16 -8 -27 -17 -10 -10 -37 -33 -59 -52 -166 -141 -422 -395 -592 -586 -228 -257 -536 -672 -688 -925 -21 -36 -43 -66 -47 -68 -4 -2 -8 -7 -8 -11 0 -5 -24 -48 -54 -97 -156 -261 -493 -915 -480 -935 2 -3 47 -21 101 -38 54 -18 107 -36 118 -41 58 -25 458 -138 640 -181 118 -27 126 -29 155 -35 14 -2 45 -9 70 -14 66 -15 137 -28 300 -55 37 -7 248 -33 305 -39 28 -3 84 -9 125 -13 163 -16 792 -8 913 12 12 2 58 9 102 15 248 35 423 76 665 157 58 19 134 46 170 60 86 33 344 156 348 166 2 4 8 7 13 7 14 0 205 116 303 184 180 126 287 216 466 396 282 281 511 593 775 1055 43 75 178 347 225 455 100 227 236 602 286 790 59 220 95 364 120 485 6 28 45 245 50 275 2 14 7 41 10 60 3 19 8 49 10 65 2 17 6 46 9 65 15 100 35 262 40 335 3 39 8 89 10 112 22 225 33 803 21 1043 -3 41 -7 129 -11 195 -3 66 -8 136 -10 155 -2 19 -6 76 -10 125 -3 50 -8 101 -10 115 -2 14 -6 57 -10 95 -7 72 -12 113 -20 175 -2 19 -7 55 -10 80 -6 46 -43 295 -51 340 -2 14 -9 54 -15 90 -5 36 -16 97 -24 135 -8 39 -17 84 -20 100 -12 68 -18 97 -50 248 -19 87 -47 204 -61 260 -14 56 -27 109 -29 117 -30 147 -232 810 -253 832 -4 4 -7 -23 -8 -60z"></path>
			        </svg> -->
				</a>
				<button class="navbar-close" v-on:click="isShow = false">
					<svg class="h-6 w-6 text-white cursor-pointer hover:text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
					</svg>
				</button>
			</div>
			<div :class="isShow?'block':'hidden'">
				<ul v-for="page in pages">
					<li class="mb-1">
						<a class="block p-4 text-sm font-semibold text-white hover:bg-blue-50 hover:text-blue-600 rounded" :href="page.link">{{ page.name }}</a>
					</li>
				</ul>
				<hr :class="login?'block':'hidden'">
				<ul :class="login?'block':'hidden'">
					<li class="mb-1">
						<button v-on:click="showProfile()" class="block p-4 text-sm font-semibold text-white hover:bg-blue-50 hover:text-blue-600 rounded w-full text-center btn">profile</button>
					</li>
					<li class="mb-1">
						<a href="/pengajuan-inovasi" class="block p-4 text-sm font-semibold text-white hover:bg-blue-50 hover:text-blue-600 rounded w-full text-center btn">pengajuan inovasi</a>
					</li>
					<li class="mb-1">
						<button v-on:click="logout()" class="block p-4 text-sm font-semibold text-white hover:bg-blue-50 hover:text-blue-600 rounded w-full btn">sign out</button>
					</li>
					
				</ul>

			</div>
			<div class="mt-auto" :class="isShow?'block':'hidden'">
				<div class="pt-6" :class="login?'hidden':''">
					<a class="block px-4 py-3 mb-3 leading-loose text-xs text-center font-semibold leading-none bg-gray-50 hover:bg-gray-100 rounded-xl" href="/login">Sign in</a>
					<a class="block px-4 py-3 mb-2 leading-loose text-xs text-center text-white font-semibold bg-blue-600 hover:bg-blue-700  rounded-xl" href="/register">Sign Up</a>
				</div>
				<p class="my-4 text-xs text-center text-white">
					<span>Copyright © 2023</span>
				</p>
			</div>
		</nav>
		<!-- modal -->
		<dialog id="modal_profile" class="modal">
  <form method="dialog" class="modal-box" >
    <h3 class="font-bold text-lg text-center uppercase border-b">Profile</h3>
      <table>
		<tr>
			<td>Nama</td>
			<td> &nbsp;&nbsp;: {{ datauser.fullname }}</td>
		</tr>
		<tr>
			<td >Email</td>
			<td> &nbsp;&nbsp;: {{ datauser.email }}</td>
		</tr>
		<tr>
			<td >No Hp</td>
			<td>&nbsp; : {{ datauser.phone }}</td>
		</tr>
		<tr>
			<td >Instansi</td>
			<td>&nbsp; : {{ datauser.instansi }}</td>
		</tr>
	  </table>
    <div class="modal-action">
      <!-- if there is a button in form, it will close the modal -->
      <button class="btn w-full bg-slate-600 text-white">Close</button>
    </div>
  </form>
</dialog>
	</div>
    </div>
</template>
<script>
import { initFlowbite } from 'flowbite'
export default {
    name:'navbar',
	props: ['title'],
    data() {
        return {
            isShow:false,
			login:false,
			datauser:'',
            pages:[
                { name: 'Beranda',link:'/', active:(this.title == "Beranda")?true:false},
                { name: 'Pengumuman Pemenang',link:'/pemenang', active:(this.title == "Pemenang")?true:false},
                { name: 'Events',link:'/events', active:(this.title == "Events")?true:false},
                { name: 'Kontak',link:'/kontak', active:(this.title == "Kontak")?true:false}
            ],
            border:2
        }
    },
	methods: {
		showProfile(){
			modal_profile.showModal()
		},
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
	},
	mounted: function() {
           initFlowbite()
	},
	created: function() {
        let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_MYINFO
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
                 let data = await res.json()
				//  console.log(data)
				 this.datauser = data
                this.login = true
            } else {
                this.login = false
            }
		  })
      
          .catch((err)=> {
            this.login = false
             console.log(err)
             
          })
        
    }
}
</script>