<template>
  <div class="w-full h-screen overflow-hidden">
    <div class="bg-blue-500 w-full h-1/3"></div>

    <div class="w-full h-[100%] absolute top-20 md:px-32 lg:px-32 px-10">
      <div class="w-full h-[70%] bg-white rounded-lg flex md:pr-10 lg:pr-10 mt-[1%]">
        <div class=" md:block lg:block hidden w-1/2 h-full flex flex-col">
          <div
            class=" w-fit text-center mt-[0%] self-center text-2xl text-blue-400 font-extrabold"
          >
            <img src="../assets/img/logo.png" class="w-[100%]" />
          </div>
        </div>

        <div class="md:w-1/2 lg:w-1/2 w-full h-full mt-5">
          <div class="w-full h-full shadow-2xl rounded-2xl md:p-10 lg:p-10 p-5">
            <h1 class="mb-8 text-blue-500 w-full text-center font-bold text">
              Login Admin
            </h1>
  
              <div>
                <div class="text-sm font-bold text-gray-700 tracking-wide">
                  Email Address
                </div>
                <input
                  v-model="email"
                  class="text-slate-500 w-full text-lg py-2 border-b border-gray-300 focus:outline-none focus:border-blue-500"
                  type="email"
                  placeholder="mike@gmail.com"
                />
              </div>
              <div class="mt-8">
                <div class="flex justify-between items-center">
                  <div class="text-sm font-bold text-gray-700 tracking-wide">
                    Password
                  </div>
                  <div></div>
                </div>
                <input
                  v-model="password"
                  class="text-slate-500 w-full text-lg py-2 border-b border-gray-300 focus:outline-none focus:border-blue-500"
                  type="password"
                  placeholder="Enter your password"
                />
              </div>
              <div class="mt-10">
                <button
                  v-on:click="handleLoginClick()"
                  class="bg-blue-500 text-gray-100 p-4 w-full rounded-full tracking-wide font-semibold font-display focus:outline-none focus:shadow-outline hover:bg-blue-600 shadow-lg"
                >
                  Log In
                </button>
              </div>
       
          </div>
        </div>
      </div>
    </div>
    <div class="bg-white w-full h-full flex justify-center">
      <h1 class="text-white self-center mt-[5%]">&copy; Muhammad Husen</h1>
    </div>
  </div>
</template>

<script>
export default {
  name: "login",
  components: {},
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
     handleLoginClick() {
      let data = {
        email: this.email,
        password: this.password,
      };
    //   alert(import.meta.env.VITE_API_URL)
        let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_LOGIN
        fetch(baseURL+endpoint, {
          method: "POST",
          credentials:'include',
          headers: {
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
          body: JSON.stringify(data),
        })
          .then((res) => res.json())
          .then((res) =>{
            if(res.isAdmin) {
              this.$router.push( {name:'dashboard'})
            }
          }) 
         
      }
    },
    created: function () {
        let baseURL = import.meta.env.VITE_API_URL
        let endpoint = import.meta.env.VITE_API_CEKLOGIN
        fetch(baseURL+endpoint, {
          method: "GET",
          credentials:'include',
          headers: {
            Accept: "application/json, text/plain, */*",
            "Content-Type": "application/json",
          },
        })
        .then((res) => res.json())
          .then((res)=> {
            if(res.status !== 200 || res.isAdmin == false) {
                this.$router.push( {name:'login'})
            }
            console.log(res.status)
          }).catch((err)=> {
            
          })
    }

};
</script>
