<template>
    <div class="flex bg-white">
      <Sidebar />
      <div class="w-full">
        <Topbar />
        <div class="w-full px-[5%] py-[5%]">
          <div class="relative overflow-x-auto  sm:rounded-lg">
            <div class="flex items-center justify-between">
              <div>
                <button v-on:click="createEventModal()" class="btn btn-success text-white">Add</button>
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
                  placeholder="Search for items"
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
                  <th scope="col" class="px-6 py-3">Poster</th>
                  <th scope="col" class="px-6 py-3">Judul Event</th>
                 
                  <th scope="col" class="px-6 py-3">Action</th>
                </tr>
              </thead>
              <tbody>
                <tr
                  v-for="event in tableEvent"
                  class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600"
                >
                  <td
                    scope="row"
                    class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
                  >
                    <img :src="baseURL+'/'+event.poster" alt="" class="w-36">
                  </td>
  
                  <td class="px-6 py-4">
                    {{ event.judul }}
                  </td>
              
                  <td class="px-6 py-4">
                      <div class="flex gap-2">
                        <button class="btn" v-on:click="showDetail(event)">detail</button>
                        <button
                        
                        class="btn btn-warning text-white" >update</button>
                        <button 
            
                         class="btn bg-red-700 text-white" >delete</button>
                      </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <!-- modal detail-->
<dialog id="my_modal_2" class="modal">
    <div class="modal-box">
      <h3 class="font-bold pb-2 text-center">Detail Event</h3>
      <h3 class="font-light text-xs border-b  pb-2 text-center">{{ datamodal.tanggal }}</h3>
      <div class="w-full">
          <div class="flex gap-4 mt-3"> 
              <p class="w-[37%]">Judul Event</p>
              <p>:  {{ datamodal.judul }}</p>
          </div>
          <div class="flex gap-4"> 
              <p class="w-[37%]">mulai event </p>
              <p>:  {{ datamodal.start }}</p>
          </div>
          <div class="flex gap-4"> 
              <p class="w-[37%]">akhir event </p>
              <p>:  {{ datamodal.end }}</p>
          </div>
          <div class="flex gap-4"> 
              <p class="w-[37%]">di post oleh</p>
              <p>:  {{ datamodal.create_by }}</p>
          </div>
          <div class="flex gap-4"> 
              <p class="w-[37%]">dipost pada </p>
              <p>:  {{ datamodal.tanggal }}</p>
          </div>
     
          <div class="mt-5"> 
              <p class="w-fit border-b pb-1 pr-3">Deskripsi </p>
              <p v-html="datamodal.deskripsi"></p>
          </div>
          
          <div class="w-full h-fit overflow-y-scroll">
           <div class="w-full flex" >
              <a v-for="(im,index) in datamodal.docs" :href="baseURL+'/'+im.url_dokumen" target="_blank" class="btn mt-2 mr-2" >{{ im.jenis_docs }}</a>
           </div>
          </div>
          
  
          
      </div>
    </div>
    <form method="dialog" class="modal-backdrop">
      <button>close</button>
    </form>
</dialog>
<!-- modal create/update -->
<dialog id="my_modal_3" class="modal">
    <div class="modal-box bg-white text-black">
      <h3 class="font-bold pb-2 text-center">{{modalTitle}} Event</h3>
      <h3 class="font-light text-xs border-b  pb-2 text-center"></h3>
      <div class="w-full">
        <p class="mb-2 mt-2 ml-2">Judul Event</p>
        <input type="text" 
        class="w-full rounded-xl text-black"
         v-model="model_event.judul"/>
        <p class="mb-3 mt-2 ml-2">Poster event :</p>
        <input type="file" class="w-full rounded-xl text-black"
        v-on:change="previewFiles" :multiple="false" />
        <p class="mb-2 mt-2 ml-2">Mulai Event</p>
        <input type="date" class="w-full rounded-xl text-black"
        v-model="model_event.start"/>
        <p class="mb-2 mt-2 ml-2">Akhir Event</p>
        <input type="date" class="w-full rounded-xl text-black"
        v-model="model_event.end"/>
        <p class="mb-2 mt-2 ml-2">Deskripsi Event</p>
        <QuillEditor  contentType="html" theme="snow" v-model:content="model_event.deskripsi"/>
        <button v-on:click="save()" class="btn w-full bg-green-600 mt-5 hover:bg-green-300">Save</button> 
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
    name: "adminevent",
    components: { Topbar, Sidebar, QuillEditor },
    data() {
      return {
        baseURL:import.meta.env.VITE_API_URL,
        tableEvent: [],
        message: {
            title:'gagal',
            text:'',
        },
        warning:false,
        background:'',
        alertmessage:'',
        modalTitle:'',
        datamodal:[],
        model_event:{
            judul:'',
            poster:'',
            start:'',
            end:'',
            deskripsi:''
        }
      };
    },
    methods: {
        messageModal(){
            my_modal_4.showModal()
        },
        save(){
            console.log(this.model_event)
            let baseURL = import.meta.env.VITE_API_URL
           let endpoint = import.meta.env.VITE_API_POST_EVENTS
           let token = 'Bearer '+localStorage.getItem('token')
           let datatosend = new FormData();
           datatosend.append('judul',this.model_event.judul)
           datatosend.append('file', this.model_event.poster)
           datatosend.append('start', this.model_event.start)
           datatosend.append('end', this.model_event.end)
           datatosend.append('deskripsi', this.model_event.deskripsi)

        fetch(baseURL+endpoint, {
          method:"POST",
          headers:{
               'Authorization':token
          },
          body: datatosend,
            }).then(res => res.json())
            .then((res)=>{
                if(res.status === "OK")  {
                  this.message.title ='success'
                  this.message.text ='Berhasil Memposting Event'
                  this.setModelDefault()
                  this.messageModal()
                } else {
                    this.message.title ='failed'
                  this.message.text ='Gagal Memposting Event'
                  this.messageModal()
                }
            }).catch((err)=> {
                this.message.title ='failed!'
                  this.message.text ='Gagal Memposting Event'
                  this.messageModal()
              console.log(err)
            })
        },
        setModelDefault(){
            this.model_event.judul = '';
        this.model_event_poster = '';
        this.model_event.start = '';
        this.model_event.end = '';
        this.model_event.deskripsi ='';
      
        },
        previewFiles(event) {
      console.log(event.target.files[0]);
      this.model_event.poster = event.target.files[0]
       },
      async createEventModal() {
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
            this.tableEvent = res.data;
          //   console.log(this.tableEvent);
          });
      },
    },
    mounted: function () {
      initFlowbite()
      this.getAll();
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
  