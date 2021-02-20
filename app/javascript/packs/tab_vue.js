import Vue from 'vue/dist/vue.esm'
// import App from 'App.vue'

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    data: () => {
      return {
      }
    },
    // components: { App }
  })
}),


new Vue({
  el: '#tabs',
  data: {
    // num: 1,
    isActive: 1,
    href:`/tasks/new?category_id=1`,
  },
  methods: {
    change: function(num){
      this.isActive = num
      this.href = `/tasks/new?category_id=${num}`
    }
  }
})




//仕組み
//changeイベントが発火した時
//isActiveの数字が変わる
// numが変わることで、リンク先も変わる

// https://jp.vuejs.org/v2/api/#mounted