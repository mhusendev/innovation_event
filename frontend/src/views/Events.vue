<template>
    <div class="w-full h-screen overflow-auto bg-white text-black" style="scroll-behavior: smooth;">
        <Navbar :title="title"/>
      
          
    <div class="flex justify-center items-center">
        <h1 class="mt-10 border-b-2 border-black pb-2 text-xl font-bold">EVENTS</h1>
    </div>
        <div class="w-full max-h-[900px] px-10 py-5 overflow-y-auto" id="events"  >
            
            <div v-for="(data,index) in events" class="w-full h-fit bg-white px-5 py-3 shadow-xl rounded-xl my-5">
                <div class="w-full md:flex block py-3">
                   <img :src="url_foto+data.poster"
                   class="md:w-[30%] w-[100%] object-cover md:object-contain" alt="">
                   <div class="w-full md:px-5 mt-2 md:mt-0 ">
                    <h1 class="font-bold text-xl border-b border-black pb-3">{{ data.judul }}</h1>
                   
                   <button v-on:click="descShow[index] = !descShow[index]" class="btn  mt-2 flex w-full bg-blue-800">Deskripsi <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    </button>
                            
                    <p :class="descShow[index]?'block mt-3 p-3 border border-slate-900':'hidden'" class="text-sm" v-html="data.deskripsi"></p>
                    <div class="w-full flex overflow-auto mt-5">
                        <div  v-for="d in data.docs" >
                          <a 
                          v-if="(d.jenis_docs !=='surat')&&(d.jenis_docs !=='proposal')&&(d.jenis_docs !=='foto cover')" 
                          :href="url_foto+d.url_dokumen" target="_blank" class="btn text-white text-xs m-2">{{ d.jenis_docs }}</a>
                        </div>
                    </div>
                   </div>
                </div>
            </div>

           
        </div>
    </div>
</template>
<script>
import Navbar from '../components/Navbar.vue';
export default {
    name:'events',
    components: {Navbar},
    data(){
        return{
            isShow:false,
            userLogin:false,
            descShow:[],
            title:'Events',
            url_foto:import.meta.env.VITE_API_URL+'/',
            title:'Events',
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
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_EVENTS
     
        fetch(baseURL+endpoint, {
          method: "GET",
          headers: {
            'Bypass-Tunnel-Reminder': 'true',
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
        })
          .then((res) => res.json())
          .then((res)=> {
           this.events = res.data
           for(let i in this.events) {
            this.descShow.push(false)
           }
           console.log(this.events)
          })
          .catch((err)=> {
            console.log(err)
          })
        

        }
    },
    created: function() {
        this.getall()

    }
    
}
</script>
