# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :users
- has_many :items

## userテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|password|string|null: false|

### Association
- has_many :messages
- belongs_to :group

## messageテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|group_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## itemテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|text|null: false|
|unit|string|null: false|
|item-group_id|references|null: false, foreign_key: true|
|item-count_id|references|null: false, foreign_key: true|

### Association
- has_many :item-datas
- belongs_to :item-group

## item-groupテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item_id|references|foreign_key: true|

### Association
- has_many :items

## item-countテーブル
|Column|Type|Options|
|------|----|-------|
|count|integer|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item