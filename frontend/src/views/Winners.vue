<template>
    <div class="w-full h-screen overflow-auto bg-white text-black" style="scroll-behavior: smooth;">
        <Navbar :title="title"/>
      
          
    <div class="flex justify-center items-center">
        <h1 class="mt-10 border-b-2 border-black pb-2 text-xl font-bold">PEMENANG</h1>
    </div>
    <div class="w-full max-h-96 mt-10 overflow-y-scroll px-[5%]">
            <table
              class="w-full text-sm text-left text-gray-500 dark:text-gray-400"
            >
              <thead
                class="text-xs sticky top-0 text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400"
              >
                <tr>
                  <th scope="col" class="px-6 py-3">Nama</th>
                  <th scope="col" class="px-6 py-3">Perangkat Daerah</th>
                  <th scope="col" class="px-6 py-3">Event</th>
                  <th scope="col" class="px-6 py-3">Tanggal</th>
                  <th scope="col" class="px-6 py-3">Nilai</th>
                 
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="winners in tableWinners"
                  class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600"
                >
                  <td
                    scope="row"
                    class="px-6 py-4"
                  >
                   {{ winners.nama_inovasi }}
                  </td>
  
                  <td class="px-6 py-4">
                    {{ winners.nm_perangkat_daerah }}
                  </td>
                  <td class="px-6 py-4">
                    {{ winners.event }}
                  </td>
                  <td class="px-6 py-4">
                    {{ winners.tanggal_inovasi }}
                  </td>
                  <td class="px-6 py-4">
                    {{ winners.nilai }}
                  </td>
              
            
                </tr>
              </tbody>
            </table>
          </div>
    </div>
</template>
<script>
import Navbar from '../components/Navbar.vue';
export default {
    name:'winners',
    components: {Navbar},
    data(){
        return{
            isShow:false,
            userLogin:false,
            descShow:[],
            title:'Pemenang',
            tableWinners:[],
            url_foto:import.meta.env.VITE_API_URL+'/',
            data:{
                fullname:'',
                email:'',
                phone:'',
                instansi:''
            },
            events:[]
        }
    },
    methods: {
        scrollTo() {
            document.querySelector('#events').scrollTo({
        bottom: 500,
        behavior: 'smooth'
    })
    },
        getall(){
            
            let baseURL = import.meta.env.VITE_API_URL;
        let endpoint = import.meta.env.VITE_API_GET_WINNERS;
        let token = 'Bearer '+localStorage.getItem('token')
          //console.log(token)
          fetch(baseURL+endpoint, {
            method: "GET",
            credentials:'include',
            headers: {
             'Bypass-Tunnel-Reminder': 'true',
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
        })
          .then((res) => res.json())
          .then((res) => {
            this.tableWinners = res.data;
          //   console.log(this.tableWinners);
          });

        }
    },
    created: function() {
        this.getall()

    }
    
}
</script>
