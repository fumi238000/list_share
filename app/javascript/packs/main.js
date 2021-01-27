import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    data: () => {
      return {
      }
    },
    components: { App }
  })
}),

new  Vue({
  el: '#app',
  data: {
    message: 'Hello Vue.js'
  }
})