## LIST SHARE
チェックリストを作成・共有するサービスです。
  
### URL
[LIST_SHARE](https://list-share-app-staging.herokuapp.com){:target="_blank"}

簡単ログインは現在調整中です

  
  
  
  
### 制作背景
#### 自分の使用しているサービスを改善したい
　私は、ここ１年くらい「自分の習慣の仕組みする」ためにいろんなアプリを使ってきました。
そして、私の場合は、habitifyというアプリを使用して「自分のチェックリストを作ること」で習慣化ができるようになりました。
　ただ、そのアプリには、改善したい部分があります。それが、「並べ替えに手間がかかる」という点です。私は飽き性なので、変化を与えるために順番を並べ替えるということがよくあります。しかし、そのアプリは順番を入れ替えるために別ページへ移動し並べ替えをする必要があり、
その都度5分ほど時間がかかります。これを一覧画面で修正できるようできれば、もっと使いやすくなると考えました
<br>

  
### 解決したい課題
#### リストを共有して使用できる
　改善だけでは、他のサービスと差別化を図ることが難しいと考え、作成したチェックリストを他の人と共有することができれば、より使ってもらえるかと思いました（家族での日課など）。
　類似サービスはあるのですが、「複数タスクをカテゴリー化できない」ため、
「複数タスクのカテゴリー化」＋「カテゴリーを共有できるサービス」
を実装したいと考えました
  
  
  
## 機能一覧
* ユーザー新規登録
* ログイン・ログアウト機能（devise)
* ゲストログイン機能（devise)
* 画像アップロード機能(carrierwave)
* カテゴリー作成機能（CRUD）
* タスク作成機能（CRUD）
* 並べ替え機能（acts_as_list)
* カテゴリー共有機能
* コメント機能（タスクに対して）

## 今後実装予定
* チェックボックス リセット機能（未構成）
* タスクのクリックアクション（チェックしたとき、チェックしていないタスクの下に移動する）
* カテゴリーをまとめる機能の追加
（カテゴリーをまとめられると、「習慣」「仕事」みたいな形で、よりわけられるとよいかもしれない）
* コメントに写真を添付できるようにしたい
* 曜日指定で、タスクが表示されないようにする
  
## 環境・使用言語
  
  
### フロントエンド
* HTML/CSS
* Bootstrap
* JavaScript
* Vue.js
  
  
### バックエンド
* Ruby
* Ruby on Rails
  
  
### 開発環境
* PostgreSQL  
  
### 本番環境
* PostgreSQL  
  
  
### テスト
* Rspec (単体／結合）
  
  
  
### インフラ
- Heroku
  
  
  
  
## 資料
  
  
### ER図
<img width="1084" alt="スクリーンショット 2020-12-07 11 57 48" src="https://user-images.githubusercontent.com/64491435/101304452-9f55be80-3883-11eb-8d53-f2c6b058a064.png">

##### ER図・ユースケース
(https://drive.google.com/file/d/1pV26x36maggRPssRgNHyUCD-f_0umsH-/view?usp=sharing)

##### 用件定義・ユースケース  
(https://docs.google.com/spreadsheets/d/1UjPEs-39oeIc-ZluBtAswBnVYScy2kK0Uu3jaOKYKe4/edit?usp=sharing)
  
### About me
新卒で４年間、新築住宅会社の営業をしておりました。2020年4月からWebエンジニアを目指して勉強中です。
