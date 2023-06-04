/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx,vue}",
  ],
  theme: {
    extend: {
      backgroundImage: theme => ({
        'hero':"url(@/assets/img/hero.jpg)",
        'user':"url(@/assets/img/user.png)"
      })
    },
  },
  plugins: [
    require('flowbite/plugin'),
    require("daisyui")
  ],
}