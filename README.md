# README

## アプケーション名 

### *My Storage*

### アプリケーション概要
記事投稿サイト  
学習のノートがわりに  

### URL
https://my-storage.herokuapp.com/

### テストアカウント
user      :test@test  
password  :test111

### 利用方法

ユーザー登録後、右上「New Word」より記事を投稿  
投稿本文はマークダウン記法で投稿  
ログインユーザーは投稿記事へコメント可  

### 目指した課題解決

自身の過去の課題解決で行ってきた問題点、考え方のまとめ  
アウトプットによる理解度の向上  
記録するためのメモ・ノート替わり  

### 洗い出した要件

- ユーザー登録機能
- 記事投稿機能
- 記事編集・削除機能
- 検索機能
- コメント機能
- ユーザー別投稿・コメント一覧表示

### 実装した機能についてのGIFと説明


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


### ローカルでの動作方法
mac BigSur 11.0.1  
ruby 2.6.5  
Rails 6.0.3  
mysql  Ver 14.14  
