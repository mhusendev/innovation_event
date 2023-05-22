import { createRouter, createWebHistory } from "vue-router";

const routes =  [
    {path:'/',name:'login2',component:()=> import('@/views/Login.vue')},
    {path:'/admin/login',name:'login',component:()=> import('@/views/Login.vue')},
    {path:'/admin/dashboard',name:'dashboard',component:()=> import('@/views/Dashboard.vue')}
]

const router = createRouter({
    routes,
    history: createWebHistory(),
})

export default router