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
  el: '#tabs',
  data: {
    isActive: '1',
    category_id: ''

  },
  methods: {
    change: function(num){
      this.isActive = num
      this.category_id = num
    }
  }
})


//  var app = new Vue({
//    el: '#app',
//    data: {
//      now: ''
//    },
//     methods: {
//       onclick: function(){

//         // this.now = new Date().toLocaleString();

//         // ここにcategory_idを渡したい！
//         this.now = '@task' ;

//       }
//     } 
//  })
