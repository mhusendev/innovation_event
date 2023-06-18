<template>
    <div class="w-full h-screen overflow-auto bg-white text-black" style="scroll-behavior: smooth;">
        <Navbar :title="title"/>
        <div class="w-full md:h-[490px] lg:h-[490px] h-[620px]  bg-no-repeat bg-cover
         bg-center bg-hero bg-fixed ">
               
                <h1 class=" h-full w-full text-center md:text-5xl lg:text-5xl text-2xl font-bold text-white md:pt-[15%] pt-[50%] lg:pt-[15%] py-3 bg-opacity-50 bg-fixed bg-slate-900 m-0">RUANG PUBLIK INOVASI DAERAH</h1>
        </div>
        <div class="w-full h-fit pt-[2%]   flex justify-center items-center bg-slate-900 shadow-md">
            <a href="#inovasi"   class="text-lg font-bold border-b-2 border-white mb-1 pb-[1%]  text-white ">INOVASI</a>
        </div>
     
        <div class="w-full max-h-[900px] px-10 py-5 overflow-y-auto" id="inovasi"  >
            
            <div v-for="data in inovasi" class="w-full bg-white px-5 py-3 shadow-xl rounded-xl my-5">
                <div class="w-full md:flex block py-3">
                   <img :src="url_foto+data.docs.filter(a =>  a.    jenis_docs == 'foto cover')[0].url_dokumen"
                   class="md:w-[30%] w-[100%] object-cover" alt="">
                   <div class="w-full md:px-5 mt-2 md:mt-0 ">
                    <h1 class="font-bold text-xl border-b border-black pb-3">{{ data.nama_inovasi }}</h1>
                    <div class="grid grid-cols-1 md:grid-cols-2 border-b border-black pb-2">
                        <div class="flex ">
                            <div class="w-full md:w-[50%] text-xs">Inovator</div>
                            <div class="w-full text-xs">: {{ data.inovator }}</div>
                        </div>
                        <div class="flex ">
                            <div class=" w-full md:w-[30%] text-xs">Inisiator </div>
                            <div class="w-full text-xs">: {{ data.inisiator }}</div>
                        </div>
                        <div class="flex ">
                            <div class="w-full md:w-[50%] text-xs">Tgl Pengajuan</div>
                            <div class="w-full text-xs">: {{ data.tanggal }}</div>
                        </div>
                        <div class="flex ">
                            <div class="w-full md:w-[30%] text-xs">Jenis </div>
                            <div class="w-full text-xs">: {{ data.jenis }}</div>
                        </div>
                        <div class="flex">
                            <div class="w-full md:w-[50%] text-xs">Tahapan</div>
                            <div class="w-full text-xs">: {{ data.tahapan }}</div>
                        </div>
                        <div class="flex ">
                            <div class="w-full md:w-[30%] text-xs">Urusan </div>
                            <div class="w-full text-xs">: {{ data.jenis_urusan_inovasi }}</div>
                        </div>
                        <div class="flex">
                            <div class="w-full md:w-[50%] text-xs">inovasi terhadap covid19</div>
                            <div class="w-full text-xs">: {{ data.inovasi_thdp_covid }}</div>
                        </div>
                        <div class="flex  text-xs">
                            <div class="w-full md:w-[30%] text-xs ">Bentuk </div>&nbsp;:
                            <div class="w-full text-xs pl-1 "> {{ data.bentuk }}</div>
                        </div>
                    </div>
                    <h3 class="border-b border-black w-fit mt-2 mb-2 text-sm">Deskripsi</h3>
                    <p class="text-sm">{{ data.keterangan }}</p>
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
    name:'home',
    components: {Navbar},
    data(){
        return{
            isShow:false,
            userLogin:false,
            url_foto:import.meta.env.VITE_API_URL+'/',
            title:'Beranda',
            data:{
                fullname:'',
                email:'',
                phone:'',
                instansi:''
            },
            inovasi:[]
        }
    },
    methods: {
        scrollTo() {
            document.querySelector('#inovasi').scrollTo({
        bottom: 500,
        behavior: 'smooth'
    })
    },
        getall(){
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_ACC_INOVASI
     
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
           this.inovasi = res
           console.log(this.inovasi)
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
