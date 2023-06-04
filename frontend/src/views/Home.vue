<template>
    <div class="w-full h-screen overflow-auto bg-white text-black">
        <Navbar :title="title"/>
        <div class="w-full h-[400px]  bg-no-repeat bg-cover
         bg-center bg-hero bg-fixed ">
               
                <h1 class=" h-full w-full text-center md:text-5xl lg:text-5xl text-2xl font-bold text-white md:pt-[10%] pt-[30%] lg:pt-[10%] py-3 bg-opacity-50 bg-fixed bg-slate-900">RUANG PUBLIK INOVASI DAERAH</h1>
        </div>
        <div class="w-full h-fit pt-[2%]  flex justify-center items-center">
            <h1 class="text-3xl font-bold border-b-2 border-slate-950 pb-[1%] ">INOVASI</h1>
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
            title:'Home',
            data:{
                fullname:'',
                email:'',
                phone:'',
                instansi:''
            }
        }
    },
    
}
</script>
