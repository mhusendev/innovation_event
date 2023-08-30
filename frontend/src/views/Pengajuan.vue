<template>
   <div class="w-full h-screen overflow-auto bg-white">
    <Navbar/>
   <div class="flex justify-between">
    <h1 class="ml-10 mt-5 font-bold md:text-2xl md:border-b-2 border-b pb-3 border-black w-fit">Pengajuan inovasi</h1>
    <a :href="baseURL+'/pdf/sop.pdf'" target="_blank" class="mr-[5%] mt-[3%] btn text-white flex">
      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
  <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 14.25v-2.625a3.375 3.375 0 00-3.375-3.375h-1.5A1.125 1.125 0 0113.5 7.125v-1.5a3.375 3.375 0 00-3.375-3.375H8.25m6.75 12H9m1.5-12H5.625c-.621 0-1.125.504-1.125 1.125v17.25c0 .621.504 1.125 1.125 1.125h12.75c.621 0 1.125-.504 1.125-1.125V11.25a9 9 0 00-9-9z" />
</svg>

      SOP Pengajuan Inovasi</a>
   </div>
   
    <div class="w-full px-10 py-10">
        <div class="w-full px-5 py-5 shadow-lg rounded-lg">
            <!-- form -->
   <!-- alert -->
            <div :class="(popalert?'':'hidden') " class="w-full px-5  mb-5  text-white ">
              <div class="w-full px-5 py-3 text-white" :class="(messagealert == 'Berhasil')?'bg-green-600':'bg-red-600'">
                {{ (messagealert == 'Berhasil')?'Berhasil Mengajukan Inovasi':this.messagealert }}
              </div>
              </div> 
   <!-- end alert -->
    <div class="grid md:grid-cols-4  grid-cols-1 gap-4">
  <div class="w-full">
    <p class="mb-2">Nama Inovasi</p>
    <input type="text" class="w-full " v-model="nama_inovasi" />
    <span :class="validasi.val1 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
  </div>
  <div class="w-full">
    <p class="mb-2">Inovator</p>
    <input type="text" class="w-full " v-model="inovator"/>
    <span :class="validasi.val2 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
  </div>
 
  <div class="w-full">
    <p class="mb-2">Nama Perangkat Daerah</p>
    <input type="text" class="w-full " v-model="nama_perangkat_daerah"/>
    <span :class="validasi.val3 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
  </div>
  <div class="w-full">
    <p class="mb-2">Tahapan inovasi</p>
    <select class="w-full" v-model="selectedTahapan_inovasi">
        <option value="--pilih--">--pilih--</option>
        <option v-for="tahapan in tahapan_inovasi" :selected="selectedTahapan_inovasi === tahapan.id" :value="tahapan.nama">{{ tahapan.nama }}</option>
    </select>
    <span :class="validasi.val4 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
  </div>
  <div class="w-full">
    <p class="mb-2">Inisiator Inovasi</p>
    <select class="w-full" v-model="selectedInisiator">
        <option value="--pilih--">--pilih--</option>
        <option v-for=" inisiator_inovasi in inisiator" :selected="selectedInisiator === inisiator_inovasi.id" :value="inisiator_inovasi.nama">{{ inisiator_inovasi.nama }}</option>
    </select>
    <span :class="validasi.val5 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
  </div>
  <div class="w-full">
    <p class="mb-2">Jenis Inovasi</p>
    <select class="w-full" v-model="selectedJenisinovasi">
        <option value="--pilih--">--pilih--</option>
        <option v-for=" jenis in jenis_inovasi" :selected="selectedJenisinovasi === jenis.id" :value="jenis.nama">{{ jenis.nama }}</option>
    </select>
    <span :class="validasi.val6 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
</div>
<div class="w-full">
    <p class="mb-2">Bentuk Inovasi</p>
    <select class="w-full" v-model="selectedBentukinovasi">
        <option value="--pilih--">--pilih--</option>
        <option v-for=" bentuk in bentuk_inovasi" :selected="selectedBentukinovasi === bentuk.id" :value="bentuk.nama">{{ bentuk.nama }}</option>
    </select>
    <span :class="validasi.val7 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
</div>
<div class="w-full">
    <p class="mb-2">Inovasi Terhadap Pandemi Covid19</p>
    <select class="w-full" v-model="selectedInovasiCovid">
        <option value="--pilih--">--pilih--</option>
        <option v-for=" inovasi_c in inovasi_covid" :selected="selectedInovasiCovid === inovasi_c.id" :value="inovasi_c.nama">{{ inovasi_c.nama }}</option>
    </select>
    <span :class="validasi.val8 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
</div>
<div class="w-full">
    <p class="mb-2">Jenis Urusan Inovasi</p>
    <select class="w-full" v-model="selectedJenisUrusan">
        <option value="--pilih--">--pilih--</option>
        <option v-for=" jenis_u in jenis_urusan" :selected="selectedJenisUrusan === jenis_u.id" :value="jenis_u.nama">{{ jenis_u.nama }}</option>
    </select>
    <span :class="validasi.val9 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
</div>
<div class="w-full">
    <p class="mb-2">Tema Inovasi</p>
    <select class="w-full" v-model="selectedTemaInovasi">
        <option value="--pilih--">--pilih--</option>
        <option v-for=" tema in tema" :selected="selectedTemaInovasi === tema.id" :value="tema.nama">{{ tema.nama }}</option>
    </select>
    <span :class="validasi.val10 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
</div>
  <!-- ... -->
  
   </div> 
    <div class="w-full mt-5">
        <p class="mb-2">Deskripsi Inovasi</p>
        <span :class="validasi.val11 ? '':'hidden'" class="inline-flex text-sm text-red-700">data tidak boleh kosong*</span>
        <QuillEditor  contentType="html" theme="snow" v-model:content="keterangan"/>
        
    </div>

            <!-- endform -->

        </div>
    <!-- table for upload -->
    <div class="w-full px-5 py-5 shadow-lg rounded-lg">
         <p class="mb-5 mt-2 border-b w-fit border-black pb-3">Upload Dokumentasi</p>
         <p class="mb-5 text-sm text-red-500">{{ file_eror }}</p>
         <p class="mb-5 text-sm">* Untuk Jenis File Proposal dan Surat adalah pdf , untuk vidio mkv/mp4, untuk gambar jpg/jpeg </p>
         <div class="w-[100%] grid grid-cols-1 md:grid-cols-3 gap-4">
            <input type="file" class="w-full" v-on:change="previewFiles" :multiple="false"/>
            <select class="w-ful mr-10" v-model="selectedDocs">
        <option value="--pilih--">--pilih jenis dokumen--</option>
        <option v-for=" jenis_docs in jenis_docs" :selected="selectedDocs === jenis_docs.name" :value="jenis_docs.name">{{ jenis_docs.name }}</option>
    </select>
           <div class="w-full flex">
            <button v-on:click="addFile()" class="px-3 py-2 bg-green-800 text-white rounded">Add</button>
            <button v-on:click="save()" class="w-full ml-3 px-3 py-2 bg-slate-800 text-white rounded">{{ savebtn }}</button>
           </div>
        </div>
        <p class="mb-5 mt-10 border-b w-fit border-black pb-3">List Dokumentasi Upload</p>
        <div class="w-full">
            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
                <th scope="col" class="px-6 py-3">
                No
                </th>
            
                <th scope="col" class="px-6 py-3">
                    jenis dokumen
                </th>
                
     
            </tr>
        </thead>
        <tbody>
            <tr v-for="(file,index) in filetemp">
                <td scope="col" class="px-6 py-3">
                    {{ index+1 }}
                </td>
           
                <td scope="col" class="px-6 py-3">
                    {{ file.jenis_docs}}
                </td>
                
            </tr>
        </tbody>
    </table>
        </div>
    
    </div>
     
   

    </div>
</div>
 
</template>
<script>
import Navbar from '../components/Navbar.vue';
import { QuillEditor } from '@vueup/vue-quill'
import '@vueup/vue-quill/dist/vue-quill.snow.css';
export default {
    name:'pengajuan',
    components: {Navbar,QuillEditor},
    data() {
        return {
          baseURL:import.meta.env.VITE_API_URL,
            file:'',
            filetemp:[],
            inovator: '',
            savebtn: 'Save',
            selectedTahapan_inovasi:'--pilih--',
            selectedInisiator:'--pilih--',
            selectedJenisinovasi:'--pilih--',
            selectedBentukinovasi:'--pilih--',
            selectedInovasiCovid:'--pilih--',
            selectedJenisUrusan:'--pilih--',
            selectedTemaInovasi:'--pilih--',
            selectedDocs:'--pilih--',
            jenis_docs: [{
                name:'surat',
            },
            {
                name:'proposal',
            },
            {
                name:'foto dokumentasi',
            },
            {
                name:'vidio dokumentasi',
            },
            {
                name:'foto cover',
            }],
            nama_perangkat_daerah:[],
            tahapan_inovasi:[],
            nama_inovasi:'',
            inisiator:[],
            jenis_inovasi:[],
            bentuk_inovasi:[],
            inovasi_covid:[],
            jenis_urusan:[],
            tema:[],
            validasi_file:['proposal','surat','foto cover', 'foto dokumentasi'],
            file_eror:'',
            validasi:{
              val1:false,
              val2:false,
              val3:false,
              val4:false,
              val5:false,
              val6:false,
              val7:false,
              val8:false,
              val9:false,
              val10:false,
              val11:false
            },
            keterangan:'',
            popalert:false,
            messagealert:'Berhasil',
            arr_file:[]
        }
    },
    methods: {
      async validate () {
       this.validasi.val1 = this.nama_inovasi?false:true
       this.validasi.val2 = this.inovator?false:true
       this.validasi.val3 = this.nama_perangkat_daerah?false:true
       this.validasi.val4 = (this.selectedTahapan_inovasi == '--pilih--')?true:false
       this.validasi.val5 = (this.selectedInisiator == '--pilih--')?true:false
       this.validasi.val6 = (this.selectedJenisinovasi == '--pilih--')?true:false
       this.validasi.val7 = (this.selectedBentukinovasi == '--pilih--')?true:false
       this.validasi.val8 = (this.selectedInovasiCovid == '--pilih--')?true:false
       this.validasi.val9 = (this.selectedJenisUrusan == '--pilih--')?true:false
       this.validasi.val10 = (this.selectedTemaInovasi == '--pilih--')?true:false
       this.validasi.val11 = this.keterangan?false:true

       if(this.validasi.val1 == false && this.validasi.val2 == false
       && this.validasi.val3 == false && this.validasi.val4 == false
       && this.validasi.val5 == false  && this.validasi.val6 == false
       && this.validasi.val7 == false  && this.validasi.val8 == false
       && this.validasi.val9 == false  && this.validasi.val10 == false  && this.validasi.val11 == false) {
        let FinalArray = [];
        FinalArray = await this.validasi_file.filter (name => !this.arr_file.includes(name));
        if(FinalArray.length <1) {
          return true
        } else {
          this.file_eror = 'harap Upload berkas '+ JSON.stringify(FinalArray).replace(/[\[\]']+/g,'')
        }

     
       } else {
        return false
       }

      },
       async save(){
        // console.log(this.filetemp)
        try{
         let datavalidasi = await this.validate()
         console.log(datavalidasi)
         if(!datavalidasi) {
         this.popalert=true
         this.messagealert= 'Harap Periksa dan lengkapi data'
         setTimeout(()=>{
          this.popalert = false
          this.messagealert = ''
         },10000)

         } else {
           
              let data = await {
               nama_inovasi:this.nama_inovasi,
               inovator: this.inovator,
               nama_perangkat_daerah: this.nama_perangkat_daerah,
               tahapan:this.selectedTahapan_inovasi,
               inisiator: this.selectedInisiator,
               jenis: this.selectedJenisinovasi,
               bentuk:this.selectedBentukinovasi,
               inovasi_thdp_covid: this.selectedInovasiCovid,
               jenis_urusan:this.selectedJenisUrusan,
               tema: this.selectedTemaInovasi,
               tanggal: new Date().getDate()+"/"+new Date().getMonth()+"/"+new Date().getFullYear(),
               keterangan: this.keterangan
             }
                    console.log(data)
                    let datatosend = new FormData();
                    datatosend.append("nama_inovasi",data.nama_inovasi)
                    datatosend.append('inovator',data.inovator)
                    datatosend.append('nama_perangkat_daerah',data.nama_perangkat_daerah)
                    datatosend.append('tahapan',data.tahapan)
                    datatosend.append('inisiator',data.inisiator)
                    datatosend.append('jenis',data.jenis)
                    datatosend.append('bentuk',data.bentuk)
                    datatosend.append('inovasi_thdp_covid',data.inovasi_thdp_covid)
                    datatosend.append('jenis_urusan_inovasi',data.jenis_urusan)
                    datatosend.append('tema',data.tema)
                    datatosend.append('tanggal',data.tanggal)
                    datatosend.append('keterangan', data.keterangan)

            for(let i in this.filetemp) {
                datatosend.append('files',this.filetemp[i].data)
                datatosend.append('jenisfile',this.filetemp[i].jenis_docs)
                datatosend.append('namafile',this.filetemp[i].data.name)
            }
            let baseURL = import.meta.env.VITE_API_URL
           let endpoint = import.meta.env.VITE_POST_UPLOAD_INOVASI
           let token = 'Bearer '+localStorage.getItem('token')
           console.log(await datatosend)
           this.savebtn = 'Submitting...'
        fetch(baseURL+endpoint, {
          method:"POST",
          headers:{
               'Authorization':token
          },
          body: datatosend,
            }).then(res => res.json())
            .then((res)=>{
                this.savebtn = 'Save'
                if(res.status === "OK")  {

                  alert('Submit Berhasil')
                  window.location.href = "/pengajuan-inovasi"
                } else {
                  alert('submit gagal')
                }
            }).catch((err)=> {
              console.log(err)
              alert('submit gagal')
              this.savebtn = 'Submit'
           
            })
             

         }
        }catch(err){

console.log(err)
}
       
        },
        async addFile(){
          console.log(this.selectedDocs)
           let data = {
            jenis_docs: this.selectedDocs,
            data: this.file
           }
           this.filetemp.push(data)
           for(let i in this.filetemp){
            this.arr_file.push(this.filetemp[i].jenis_docs)
           }
           console.log(this.arr_file)
           console.log(this.filetemp[0].data.name)
        },
        previewFiles(event) {
      console.log(event.target.files[0]);
      this.file = event.target.files[0]
       },
        gettemainovasi(){
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_TEMAINOVASI
        let token = 'Bearer '+localStorage.getItem('token')
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
        .then((res) => res.json())
          .then((res)=> {
            // for(let i in res) {
            //     this.tahapan_inovasi.push(res[i])
            // }
           this.tema = res
            
          }).catch((err)=> {
            
          })
        },
        getjenisurusan(){
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_JENISURUSAN
        let token = 'Bearer '+localStorage.getItem('token')
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
        .then((res) => res.json())
          .then((res)=> {
            // for(let i in res) {
            //     this.tahapan_inovasi.push(res[i])
            // }
           this.jenis_urusan = res
            
          }).catch((err)=> {
            
          })
        },
        getinovasicovid(){
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_INOVASICOVID
        let token = 'Bearer '+localStorage.getItem('token')
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
        .then((res) => res.json())
          .then((res)=> {
            // for(let i in res) {
            //     this.tahapan_inovasi.push(res[i])
            // }
           this.inovasi_covid = res
            
          }).catch((err)=> {
            
          })
        },
        getbentukinovasi(){
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_BENTUKINOVASI
        let token = 'Bearer '+localStorage.getItem('token')
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
        .then((res) => res.json())
          .then((res)=> {
            // for(let i in res) {
            //     this.tahapan_inovasi.push(res[i])
            // }
           this.bentuk_inovasi = res
            
          }).catch((err)=> {
            
          })
        },
        getjenisinovasi(){
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_JENISINOVASI
        let token = 'Bearer '+localStorage.getItem('token')
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
        .then((res) => res.json())
          .then((res)=> {
            // for(let i in res) {
            //     this.tahapan_inovasi.push(res[i])
            // }
           this.jenis_inovasi = res
            
          }).catch((err)=> {
            
          })
        },
        getinisiator(){
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_INISIATOR
        let token = 'Bearer '+localStorage.getItem('token')
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
        .then((res) => res.json())
          .then((res)=> {
            // for(let i in res) {
            //     this.tahapan_inovasi.push(res[i])
            // }
           this.inisiator = res
            
          }).catch((err)=> {
            
          })
        },
        getTahapan(){
            let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_TAHAPAN
        let token = 'Bearer '+localStorage.getItem('token')
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
        .then((res) => res.json())
          .then((res)=> {
            // for(let i in res) {
            //     this.tahapan_inovasi.push(res[i])
            // }
           this.tahapan_inovasi = res
            
          }).catch((err)=> {
            
          })
        }
    },
    mounted: function() {
        // this.getTahapan()
        console.log(this.selectedTahapan_inovasi)
    },
    created: function() {
      let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_CEKLOGIN
        let token = 'Bearer '+localStorage.getItem('token')
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
          .then((res) => res.json())
          .then((res)=> {
            if(res.status !== 200) {
                this.$router.push( {name:'userlogin'})
            }
            console.log(res.status)
          })
          .catch((err)=> {
            this.$router.push( {name:'userlogin'})
          })
        
        this.getTahapan()
        this.getinisiator()
        this.getjenisinovasi()
        this.getbentukinovasi()
        this.getinovasicovid()
        this.getjenisurusan()
        this.gettemainovasi()
    }
}
</script>