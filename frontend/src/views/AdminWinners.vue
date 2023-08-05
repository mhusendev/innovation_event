<template>
    <div class="flex bg-white">
      <Sidebar />
      <div class="w-full">
        <Topbar :toptitle="toptitle"/>
        <div class="w-full px-[5%] py-[5%]">
          <div class="relative overflow-x-auto  sm:rounded-lg">
            <div class="flex items-center justify-between">
              <div>
                <button v-on:click="showModalAdd()" class="btn btn-success text-white">Beri Nilai</button>
              </div>
              <label for="table-search" class="sr-only">Cari</label>
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
                  <th scope="col" class="px-6 py-3">Nama</th>
                  <th scope="col" class="px-6 py-3">Perangkat Daerah</th>
                 
                  <th scope="col" class="px-6 py-3">Tanggal</th>
                  <th scope="col" class="px-6 py-3">Nilai</th>
                  <th scope="col" class="px-6 py-3">Event</th>
                  <th scope="col" class="px-6 py-3">Opsi</th>
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
                    {{ winners.tanggal_inovasi }}
                  </td>
                  <td class="px-6 py-4">
                    {{ winners.nilai }}
                  </td>

                  <td class="px-6 py-4">
                    {{ winners.event }}
                  </td>
              
                  <td class="px-6 py-4">
                      <div class="flex gap-2">
                        <button
                        v-on:click="showModaledit(winners)"
                        class="btn btn-warning text-white" >update</button>
                        <button 
                        v-on:click="showModaldelete(winners)"
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
      <h3 class="font-bold pb-2 text-center">{{modalTitle}}</h3>
      <h3 class="font-light text-xs border-b  pb-2 text-center"></h3>
      <div class="w-full">
        <select class="w-full" v-model="selectedInovasi" v-on:change="setSelectedInovasi()" v-if="modalTitle !== 'Edit'">
        <option value="--pilih--">--pilih inovasi--</option>
        <option v-for=" inovasi in listInovasi"  :value="inovasi">{{ inovasi.nama_inovasi }}</option>
    </select>
    <input type="text" class="w-full" readonly v-model="modelWinners.nama_inovasi" v-else>
    <p class="mt-5 mb-2">Perangkat Daerah</p>
    <input type="text" class="w-full" readonly v-model="modelWinners.nm_perangkat_daerah">
    <p class="mt-5 mb-2">Tanggal Inovasi</p>
    <input type="text" class="w-full" readonly v-model="modelWinners.tanggal_inovasi">
    <p class="mt-5 mb-2">Nilai</p>
    <input type="text" class="w-full"  v-model="modelWinners.nilai">
    <p class="mt-5 mb-2">Event</p>
    <input type="text" class="w-full"  v-model="modelWinners.event">
        <button v-on:click="save()" class="btn w-full bg-green-600 mt-5 hover:bg-green-300" v-if="modalTitle !== 'Edit'">Save</button> 
        <button v-on:click="update()" class="btn w-full bg-blue-600 mt-5 hover:bg-green-300" v-else>Update Nilai</button> 
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
    <p class="py-4 text-center">{{ message.text }}</p>
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
  <span>Hapus Event ?</span>
  <div class="flex gap-2">
    <button class="btn btn-sm">Tidak</button>
    <button v-on:click="deleteData()" class="btn btn-sm btn-primary">Ya</button>
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
    name: "adminwinners",
    components: { Topbar, Sidebar, QuillEditor },
    data() {
      return {
        toptitle:'Pemenang',
        baseURL:import.meta.env.VITE_API_URL,
        tableWinners: [],
        listInovasi:[],
        selectedInovasi:'--pilih--',
        message: {
            title:'gagal',
            text:'',
        },
        warning:false,
        background:'',
        alertmessage:'',
        modalTitle:'',
        datamodal:[],
        modelWinners:{
             id:'',
            nama_inovasi:'',
            nm_perangkat_daerah:'',
            nilai:'',
            tanggal_inovasi:'',
            event:''
        },
  
      };
    },
    methods: {
        setSelectedInovasi() {
            this.modelWinners.nama_inovasi = this.selectedInovasi.nama_inovasi
            this.modelWinners.nm_perangkat_daerah = this.selectedInovasi.nama_perangkat_daerah
            this.modelWinners.tanggal_inovasi = this.selectedInovasi.tanggal
        },
        deleteData(){
            let baseURL = import.meta.env.VITE_API_URL
           let endpoint = import.meta.env.VITE_API_DELETE_WINNERS
           let token = 'Bearer '+localStorage.getItem('token')
        fetch(baseURL+endpoint, {
          method:"POST",
          headers: {
            'Authorization':token,
            'Accept': "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
          body: JSON.stringify({id:this.modelWinners.id}),
            }).then(res => res.json())
            .then((res)=>{
                if(res.status === "OK")  {
                  this.message.title ='success'
                  this.message.text ='Berhasil Dihapus'
                  this.getAll()
                  my_modal_5.close()
                  this.setModelDefault()
                  this.messageModal()
                } else {
                    this.message.title ='failed'
                  this.message.text ='Gagal Dihapus'
                  my_modal_5.close()
                  this.messageModal()
                }
            }).catch((err)=> {
                this.message.title ='failed!'
                  this.message.text ='Gagal Hapus Event'
                  my_modal_5.close()
                  this.setModelDefault()
                  this.messageModal()
              console.log(err)
            })
        },
        showModaldelete(data) {
            this.modelWinners.id = data.id
            my_modal_5.showModal()
        }, 
        showModaledit(data){
        this.modalTitle = 'Edit'
         this.modelWinners.id = data.id
         this.modelWinners.nama_inovasi = data.nama_inovasi
         this.modelWinners.nm_perangkat_daerah = data.nm_perangkat_daerah
         this.modelWinners.tanggal_inovasi = data.tanggal_inovasi 
         this.modelWinners.nilai = data.nilai
         this.modelWinners.event = data.event
         my_modal_3.showModal()
        },
        messageModal(){
            my_modal_4.showModal()
        },
        update() {
          let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_PUT_WINNERS
        fetch(baseURL+endpoint, {
          method: "PUT",
          credentials:'include',
          withCredentials: true,
           headers: {
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.modelWinners),
        })
          .then((res) => res.json())
          .then((res) =>{
            if(res.status === "OK")  {
                  this.message.title ='success'
                  this.message.text = res.message
                  this.getAll()
                  my_modal_3.close()
                  this.setModelDefault()
                  this.messageModal()
                } else {
                    this.message.title ='failed'
                  this.message.text =res.message
                  this.messageModal()
                }
          
          }) 
         
      
        },
        save(){
       this.modelWinners.nama_inovasi = this.selectedInovasi.nama_inovasi
        console.log(this.modelWinners)
        let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_POST_WINNERS
        fetch(baseURL+endpoint, {
          method: "POST",
          credentials:'include',
          withCredentials: true,
           headers: {
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.modelWinners),
        })
          .then((res) => res.json())
          .then((res) =>{
            if(res.status === "OK")  {
                  this.message.title ='success'
                  this.message.text = res.message
                  this.getAll()
                  my_modal_3.close()
                  this.setModelDefault()
                  this.messageModal()
                } else {
                    this.message.title ='failed'
                  this.message.text =res.message
                  this.messageModal()
                }
          
          }) 
         
      
        
        },
        setModelDefault(){

       this.modelWinners.nama_inovasi =''
       this.modelWinners.nilai = ''
       this.modelWinners.nm_perangkat_daerah =''
       this.modelWinners.tanggal_inovasi =''
       this.modelWinners.event =''
        },
 
      async showModalAdd() {
        this.modalTitle = 'Beri Nilai'
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
      },
      getInovasi() {
      let baseURL = import.meta.env.VITE_API_URL;
      let endpoint = import.meta.env.VITE_API_GET_INOVASI;
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
          this.listInovasi = res;
        //   console.log(this.tableInovasi);
        });
    },
    },
    mounted: function () {
      initFlowbite()
      this.getAll();
      this.getInovasi();
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
  