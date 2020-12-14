import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#hello2',
    data: () => {
      return {
        message: "メッセージを導入"
      }
    },
    components: { App }
  })
}),
new Vue({
  el: '#contents',
  data: {
    isActive: '1'
  },
  methods: {
    change: function(num){
      this.isActive = num
    }
  }
})