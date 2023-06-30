<template>
    <!-- component -->
<nav class="flex justify-between px-10 py-5  rounded-full shadow-lg items-center bg-white">
  <h1 class="text-base text-slate-600 font-medium border-b-2 border-slate-600 pb-2">{{ toptitle }}</h1>
  <div class="flex items-center">
    <div class="flex items-center">
     <div class="mr-3 border-r border-slate-950 pr-3">Admin</div>
     <div class="shadow-2xl h-fit w-fit rounded-full border p-1 border-slate-950"> 
      <img src="../assets/img/user.png" class="h-10 w-10 object-cover rounded-full" alt="">
    </div>
    </div>
    
  </div>
</nav>
</template>
<script>
export default {
  name:'topbar',
  props: ['toptitle']
}
</script>
