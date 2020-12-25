import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import draggable from 'vuedraggable';



document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    data: () => {
      return {
      }
    },
    components: { App }
  })
}),


new Vue({
  el: '#hello2',
  data: {
      message: "聞こえますか？これはvue.jsなのです。htmlの書き込みではありません"
    }
})





// <template>
//   <div id="ddd">
//     <draggable element="ul">
//       <li v-for="task in tasks">{{ task }}</li>
//     </draggable>
//   </div>
// </template>

// <script>

// export default {
//   name: 'ddd',
//   components: {
//     draggable,
//   },
//   data() {
//     return {
//       tasks: [
//         'task1',
//         'task2',
//         'task3',
//         'task4',
//       ]
//     }
//   }
// }
// </script>