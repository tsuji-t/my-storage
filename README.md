# README

## アプケーション名 ： My Storage

### アプリケーション概要







# テーブル設計

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true | 
| encrypted_password   | string  | null: false               |

### Association

- has_many :words
- has_many :comments



## words テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| tug      | string     |                                |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many   :comments



## comments テーブル

| Column    | Type       | Options                           |
| --------- | ---------- | --------------------------------- |
| message   | string     | null: false                       |
| user      | references | null: false, foreign_key: true    |
| word      | references | null: false, foreign_key: true    |

### Association

- belongs_to :user
- belongs_to :word

