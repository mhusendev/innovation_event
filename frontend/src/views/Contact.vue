<template>
    <div class="w-full h-screen overflow-auto bg-white text-black" style="scroll-behavior: smooth;">
        <Navbar :title="title"/>
      
          
    <div class="flex justify-center items-center">
        <h1 class="mt-10 border-b-2 border-black pb-2 text-xl font-bold">KONTAK</h1>
    </div>
      <div class="w-full h-80 bg-slate-700 mt-10 flex justify-center items-center px-2">
           <div class="w-fit h-fit text-white  mt-[1%]  border border-white px-10 py-10">
              <table class="table">
                <tr>
                    <td class="w-[100px] uppercase font-bold">{{ Object.keys(contact[0])[1] }}</td>
                    <td>: {{ contact[0].telp }}</td>
                </tr>
                <tr>
                    <td class="w-[100px] uppercase font-bold">{{ Object.keys(contact[0])[2] }}</td>
                    <td>: {{ contact[0].email }}</td>
                </tr>
                <tr>
                    <td class="w-[100px] uppercase font-bold">{{ Object.keys(contact[0])[3] }}</td>
                    <td>: {{ contact[0].alamat }}</td>
                </tr>
                
              </table>
           </div>
      </div>
    </div>
</template>
<script>
import Navbar from '../components/Navbar.vue';
export default {
    name:'contact',
    components: {Navbar},
    data(){
        return{
     
            title:'Kontak',
            contact:[],
          
        }
    },
    methods: {
        scrollTo() {
            document.querySelector('#events').scrollTo({
        bottom: 500,
        behavior: 'smooth'
    })
    },
    getAll () {
        let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_GET_CONTACT
     
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
           this.contact = res
        
          })
          .catch((err)=> {
            console.log(err)
          })
        

        }

       
    },
    created: function() {
        this.getAll()

    }
    
}
</script>
