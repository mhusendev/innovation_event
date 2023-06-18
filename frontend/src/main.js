import { createApp } from 'vue'
import '@/style.css'
import App from '@/App.vue'
import router from '@/plugins/router'
import VueSmoothScroll from 'vue3-smooth-scroll'
createApp(App).use(router).use(VueSmoothScroll).mount('#app')
