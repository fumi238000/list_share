// import Vue from 'vue/dist/vue.esm'
import Swiper from 'swiper';
import 'swiper/swiper-bundle.css';

document.addEventListener('turbolinks:load', () => {

const swiper = new Swiper('.swiper-container', {
  // loop: true,
  effect: 'coverflow',

  //ページネーション の設定
  pagination: {
    el: '.swiper-pagination',
    type: 'bullets', 
    clickable: true, //クリックに反応させる
  },

  // Navigation arrows
  // navigation: {
  //   nextEl: '.swiper-button-next',
  //   prevEl: '.swiper-button-prev',
  // },

  // And if we need scrollbar
  scrollbar: {
    el: '.swiper-scrollbar',
  },

  //初期設定
  on: {
    init: function () {
    //TODO: 初期化した時、リストを表示させる    
    // const categoryLi = document.querySelector('#tasbs');//要素を取得
    //activeを追加する
    console.log("初期化")//テスト
    },
  },
});
  
  
//スライドした時の処理
  swiper.on('slideChange', function (num) {
    const Slide = querySelector(`.swiper-slide`)

    this.isActive = num
    console.log(isActive)
    this.href = `/tasks/new?category_id=${num}`
    console.log('activeIndex', num.activeIndex); 
    console.log(`num`,num)
    
    // activeIndexの番号がついているカテゴリーに対して、activeを付与する
    
    
    return


    
    //何を取得できるか？
    //何にactiveを付与したらいいか？
  });
  

  //Vue.jsで実装できているやつを調べる
  // どのようにした時に、リストが表示できるようになっているのか・

//-------------------------------------
// 初期化の後で Swiper のインスタンスの on メソッドで登録
mySwiper.on('slideChange', function () {
  console.log('slide changed');
});
//-------------------------------------
  

})


