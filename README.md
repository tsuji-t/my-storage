# README

### アプケーション名 

### *My Storage*

### アプリケーション概要
記事投稿サイト  
学習のノートがわりに  

### URL
https://my-storage.herokuapp.com/

### テストアカウント
user      :sample@111  
password  :sample111

### 利用方法

ユーザー登録後、右上「New Word」より記事を投稿  
投稿本文はマークダウン記法で投稿  
ログインユーザーは投稿記事へコメント可

### 目指した課題解決

自身の過去の課題解決で行ってきた問題点をまとめる中で、マークダウン記法を用いての投稿を行いたい  
記述をしやすくするための機能、またマークダウン記法を表示してくれること
記事にお気に入り機能をつけ、記事の見直しを行いやすくする

### 洗い出した要件

- ユーザー登録機能
- 記事投稿機能
- 記事編集・削除機能
- 検索機能
- コメント機能
- お気に入り登録機能
- ユーザー別 投稿・コメント・お気に入り一覧表示
- 新着・お気にり上位の一覧表示

### 実装した機能についてのGIFと説明

- マークダウン記法での新規投稿 https://gyazo.com/a28c72baf3f7c9ecc03e0b372ec0e83a
- キーワードを記事、サブタイトル、本文中より検索 https://gyazo.com/80c2f63dbdbd6fc510bad886ff7ade2a
- クリックで記事のお気に入り登録、解除 https://gyazo.com/10de0d1c8bf2d81a98427f32c345513d

### 実装予定の機能
サブタイトル(タグ)別のカテゴリー別検索機能

## テーブル設計

### users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true | 
| encrypted_password   | string  | null: false               |

#### Association

- has_many :words
- has_many :comments



### words テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| tug      | string     |                                |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |


#### Association

- belongs_to :user
- has_many   :comments



### comments テーブル

| Column    | Type       | Options                           |
| --------- | ---------- | --------------------------------- |
| message   | string     | null: false                       |
| user      | references | null: false, foreign_key: true    |
| word      | references | null: false, foreign_key: true    |

#### Association

- belongs_to :user
- belongs_to :word


### favorites テーブル

| Column    | Type       | Options                           |
| --------- | ---------- | --------------------------------- |
| user      | references | null: false, foreign_key: true    |
| word      | references | null: false, foreign_key: true    |

#### Association

- belongs_to :user
- belongs_to :word

### ER

![ER](https://user-images.githubusercontent.com/78344279/112260914-30736880-8cae-11eb-8d6b-b249cbe30d73.png)

### ローカルでの動作方法
mac BigSur 11.0.1  
ruby 2.6.5  
Rails 6.0.3  
mysql  Ver 14.14  
