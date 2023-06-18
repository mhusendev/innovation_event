import { createRouter, createWebHistory } from "vue-router";

const routes =  [
    {path:'/',name:'home',component:()=> import('@/views/Home.vue')},
    {path:'/events',name:'events',component:()=> import('@/views/Events.vue')},

    {path:'/pengajuan-inovasi',name:'pengajuan',component:()=> import('@/views/Pengajuan.vue')},
    {path:'/login',name:'userlogin',component:()=> import('@/views/Userlogin.vue')},
    {path:'/register',name:'register',component:()=> import('@/views/Register.vue')},
    {path:'/admin/login',name:'login',component:()=> import('@/views/Login.vue')},
    {path:'/admin/dashboard',name:'dashboard',component:()=> import('@/views/Dashboard.vue')},
    {path:'/admin/inovasi',name:'admininovasi',component:()=> import('@/views/AdminInovasi.vue')},
    {path:'/admin/event',name:'adminevent',component:()=> import('@/views/AdminEvent.vue')},
]

const router = createRouter({
    routes,
    history: createWebHistory(),
})

export default router