<template>
    <div class="flex bg-white">
      <Sidebar />
      <div class="w-full">
        <Topbar :toptitle="toptitle"/>
        <div class="w-full px-[5%] py-[5%]">
          <div class="relative   sm:rounded-lg">
            <div class="grid grid-cols-3 gap-20">
              <div>
                <button v-on:click="createMasterModal()" class="btn btn-success text-white">Add</button>
              </div>
              <div class="flex">
                <p class="w-1/3 mt-[5%]">Filter :</p>
             <select class="w-full" v-model="selectedMaster" v-on:change="getDataonTable">
                    <option value="--pilih--">--pilih--</option>
                   <option v-for=" data in dataMaster" :selected="selectedMaster === data.id" :value="data.id">{{ data.nama }}</option>
            </select>
         
              </div>
              <label for="table-search" class="sr-only">Search</label>
              <div class="relative">
                <div
                  class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none"
                >
                  <svg
                    class="w-5 h-5 text-gray-500 dark:text-gray-400"
                    aria-hidden="true"
                    fill="currentColor"
                    viewBox="0 0 20 20"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      fill-rule="evenodd"
                      d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                      clip-rule="evenodd"
                    ></path>
                  </svg>
                </div>
                <input
                  type="text"
                  id="table-search"
                  class="block p-2 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                  placeholder="Pencarian"
                />
              </div>
            </div>
          </div>
          <div :class="warning?background+'block':'hidden'" class="w-full  px-5 py-2 text-center ">{{ alertmessage }}</div>
          <div class="w-full max-h-96 mt-10 overflow-y-scroll">
            <table
              class="w-full text-sm text-left text-gray-500 dark:text-gray-400"
            >
              <thead
                class="text-xs sticky top-0 text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400"
              >
                <tr>
                  
                  <th scope="col" class="px-6 py-3">nama</th>
                 
                  <th scope="col" class="px-6 py-3">Action</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="master in tableMaster"
                  class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600"
                >
                 
  
                  <td class="px-6 py-4">
                    {{ master.nama }}
                  </td>
              
                  <td class="px-6 py-4">
                      <div class="flex gap-2">
                        
                       
                        <button 
                        v-on:click="showModaldelete(master)"
                         class="btn bg-red-700 text-white" >delete</button>
                      </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <!-- modal detail-->

<!-- modal create/update -->
<dialog id="my_modal_3" class="modal">
    <div class="modal-box bg-white text-black">
      <h3 class="font-bold pb-2 text-center">{{modalTitle}} Master</h3>
      <h3 class="font-light text-xs border-b  pb-2 text-center"></h3>
 <div class="w-full">
    <p></p>
    <select class="w-full" v-model="selectedMasterAdd">
                    <option value="--pilih--">--pilih jenis masterdata--</option>
                   <option v-for=" data in dataMaster" :selected="selectedMaster === data.id" :value="data.id">{{ data.nama }}</option>
    </select>
  <div class="mt-[5%]">
    <label>Nama</label>
     <input type="text" class="w-full mt-2" v-model="model_master.nama"/>
  </div>
  <button class="btn mt-[3%] w-full" v-on:click="save()">Save</button>
 </div>
    </div>
    <form method="dialog" class="modal-backdrop">
      <button>close</button>
    </form>
</dialog>
<!-- modal message -->
<dialog id="my_modal_4" class="modal bg-white">
  <form method="dialog" class="modal-box" :class="(message.title === 'success')?'bg-green-600':'bg-red-600'">
    <h3 class="font-bold text-lg text-center uppercase">{{ message.title }}</h3>
    <p class="py-4 text-center">Press ESC key or click the button below to close</p>
    <div class="modal-action">
      <!-- if there is a button in form, it will close the modal -->
      <button class="btn w-full bg-slate-600 text-white">Close</button>
    </div>
  </form>
</dialog>
<!-- modal delete -->
<!-- Open the modal using ID.showModal() method -->

<dialog id="my_modal_5" class="modal">
  <form method="dialog" class="modal-box bg-white">
    <div class="alert bg-red-600 text-white">
  <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="stroke-info shrink-0 w-6 h-6"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
  <span>Hapus ?</span>
  <div class="flex gap-2">
    <button class="btn btn-sm">Tidak</button>
    <button v-on:click="deleteMaster()" class="btn btn-sm btn-primary">Ya</button>
  </div>
</div>
  </form>
  <form method="dialog" class="modal-backdrop">
    <button>close</button>
  </form>
</dialog>
      </div>
    </div>
  </template>
  
  <script>
  import { initFlowbite } from 'flowbite'
  import Sidebar from "../components/Sidebar.vue";
  import Topbar from "../components/Topbar.vue";
  import { QuillEditor } from '@vueup/vue-quill'
import '@vueup/vue-quill/dist/vue-quill.snow.css';
  console.log(document.cookie);
  export default {
    name: "adminmaster",
    components: { Topbar, Sidebar, QuillEditor },
    data() {
      return {
        toptitle:'Master',
        baseURL:import.meta.env.VITE_API_URL,
        tableMaster: [],
        selectedMasterAdd:'--pilih--',
        message: {
            title:'gagal',
            text:'',
        },
        dataMaster: [ {
            id:1,
            nama:'Jenis Inovasi'
        },
        {
            id:2,
            nama:'Bentuk Inovasi'
        },
        {
            id:3,
            nama:'Inisiator Inovasi'
        },
        {
            id:4,
            nama:'Jenis Urusan Inovasi'
        },
        {
            id:5,
            nama:'Inovasi Terhadap Covid19 '
        },
        {
            id:6,
            nama:'Tahapan Inovasi'
        },
        {
            id:7,
            nama:'Tema Inovasi'
        }],
        selectedMaster:'--pilih--',
        warning:false,
        background:'',
        alertmessage:'',
        modalTitle:'',
        datamodal:[],
        model_master:{
            id:'',
            nama:''
        },
        temp:[],
      };
    },
    methods: {
     getDataonTable() {
     
     switch(this.selectedMaster) {
         case 1:
             this.fetchDatadynamis(import.meta.env.VITE_API_GET_JENISINOVASI)
             break;
         case 2:
             this.fetchDatadynamis(import.meta.env.VITE_API_GET_BENTUKINOVASI)
             break;
         case 3:
             this.fetchDatadynamis(import.meta.env.VITE_API_GET_INISIATOR)
             break;
         case 4:
             this.fetchDatadynamis(import.meta.env.VITE_API_GET_JENISURUSAN)
             break;
         case 5:
             this.fetchDatadynamis(import.meta.env.VITE_API_GET_INOVASICOVID)
             break;
         case 6:
             this.fetchDatadynamis(import.meta.env.VITE_API_GET_TAHAPAN)
             break;
         case 7:
             this.fetchDatadynamis(import.meta.env.VITE_API_GET_TEMAINOVASI)
             break;

     }
 },
 fetchDatadynamis(api_endpoint) {
     let baseURL = import.meta.env.VITE_API_URL;
 let endpoint = api_endpoint;
 let token = 'Bearer '+localStorage.getItem('token')
   //console.log(token)
   fetch(baseURL+endpoint, {
     method: "GET",
     credentials:'include',
     headers: {
         'Authorization':token,
     Accept: "application/json, text/plain, */*",
     "Content-Type": "application/json",
   },
 })
   .then((res) => res.json())
   .then((res) => {
     
     this.tableMaster = res
     
   
   });

 },
        deleteMaster(){
            console.log('hapus')
            switch(this.selectedMaster) {
         case 1:
             this.fetchDatadynamis_delete(import.meta.env.VITE_API_GET_JENISINOVASI)
             break;
         case 2:
             this.fetchDatadynamis_delete(import.meta.env.VITE_API_GET_BENTUKINOVASI)
             break;
         case 3:
             this.fetchDatadynamis_delete(import.meta.env.VITE_API_GET_INISIATOR)
             break;
         case 4:
             this.fetchDatadynamis_delete(import.meta.env.VITE_API_GET_JENISURUSAN)
             break;
         case 5:
             this.fetchDatadynamis_delete(import.meta.env.VITE_API_GET_INOVASICOVID)
             break;
         case 6:
             this.fetchDatadynamis_delete(import.meta.env.VITE_API_GET_TAHAPAN)
             break;
         case 7:
             this.fetchDatadynamis_delete(import.meta.env.VITE_API_GET_TEMAINOVASI)
             break;

     }
        },
        fetchDatadynamis_delete(api_endpoint){
            let baseURL = import.meta.env.VITE_API_URL
           let endpoint = api_endpoint
           let token = 'Bearer '+localStorage.getItem('token')
        
        fetch(baseURL+endpoint+'/d', {
          method:"POST",
          credentials:'include',
          headers:{
            'Authorization':token,
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
          body: JSON.stringify({id: this.model_master.id}),
            }).then(res => res.json())
            .then((res)=>{
                if(res.status === "OK")  {
                  this.message.title ='success'
                  this.message.text ='Berhasil'
                  my_modal_3.close()
                  this.setModelDefault()
                  this.messageModal()
                  setTimeout(()=>{window.location.href ='/admin/master'},3000)
                } else {
                    this.message.title ='failed'
                  this.message.text ='Gagal'
                  this.messageModal()
                }
            }).catch((err)=> {
                this.message.title ='failed!'
                  this.message.text ='Gagal'
                  this.messageModal()
              console.log(err)
            })
        },
        showModaldelete(data) {
            this.model_master.id = data.id
            my_modal_5.showModal()
        }, 
 
        messageModal(){
            my_modal_4.showModal()
        },
        save(){
             console.log(this.model_master)
            switch(this.selectedMasterAdd) {
         case 1:
             this.fetchDatadynamis_post(import.meta.env.VITE_API_GET_JENISINOVASI)
             break;
         case 2:
             this.fetchDatadynamis_post(import.meta.env.VITE_API_GET_BENTUKINOVASI)
             break;
         case 3:
             this.fetchDatadynamis_post(import.meta.env.VITE_API_GET_INISIATOR)
             break;
         case 4:
             this.fetchDatadynamis_post(import.meta.env.VITE_API_GET_JENISURUSAN)
             break;
         case 5:
             this.fetchDatadynamis_post(import.meta.env.VITE_API_GET_INOVASICOVID)
             break;
         case 6:
             this.fetchDatadynamis_post(import.meta.env.VITE_API_GET_TAHAPAN)
             break;
         case 7:
             this.fetchDatadynamis_post(import.meta.env.VITE_API_GET_TEMAINOVASI)
             break;

     }
        },
        fetchDatadynamis_post(api_endpoint){
            
           let baseURL = import.meta.env.VITE_API_URL
           let endpoint = api_endpoint
           let token = 'Bearer '+localStorage.getItem('token')
        
        fetch(baseURL+endpoint, {
          method:"POST",
          credentials:'include',
          headers:{
            'Authorization':token,
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
          body: JSON.stringify({nama: this.model_master.nama}),
            }).then(res => res.json())
            .then((res)=>{
                if(res.status === "OK")  {
                  this.message.title ='success'
                  this.message.text ='Berhasil'
                  my_modal_3.close()
                  this.setModelDefault()
                  this.messageModal()
                } else {
                    this.message.title ='failed'
                  this.message.text ='Gagal'
                  this.messageModal()
                }
            }).catch((err)=> {
                this.message.title ='failed!'
                  this.message.text ='Gagal'
                  this.messageModal()
              console.log(err)
            })
        },
        setModelDefault(){
    
    
      
        },
        previewFiles(event) {
      console.log(event.target.files[0]);
      this.model_event.poster = event.target.files[0]
       },
      async createMasterModal() {
        this.modalTitle = 'Create'
         await this.setModelDefault()
         my_modal_3.showModal()
      },
      showDetail(modaldata){
          // console.log(modaldata)
          this.datamodal = modaldata
          my_modal_2.showModal()
      },
      getAll() {
        let baseURL = import.meta.env.VITE_API_URL;
        let endpoint = import.meta.env.VITE_API_GET_EVENTS;
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
            this.tableMaster = res.data;
          //   console.log(this.tableMaster);
          });
      },
    },
    mounted: function () {
      initFlowbite()
      
    
  
    },
   
   
    created: function () {
     
      let baseURL = import.meta.env.VITE_API_URL;
      let endpoint = import.meta.env.VITE_API_CEKLOGIN;
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
        .then((res) => {
          if (res.status !== 200 || res.isAdmin == false) {
            this.$router.push({ name: "login" });
          }
          console.log(res.status);
        })
        .catch((err) => {
          this.$router.push({ name: "login" });
        });
    },
  };
  </script>
  