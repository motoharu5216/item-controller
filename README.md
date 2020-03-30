# README

## アプリ名
- 在庫管理アプリ（仮）

## 概要
- 飲食店向けの在庫の把握と、記帳をメインに設計しています。

## 作成の背景
前職が調理師で、在庫管理が苦手で、材料の補充忘れや棚卸しでかなり時間がかかっていたこともあり、
過去の自分を対象にスマホなどですぐに、在庫の状態を確認できるアプリを作ろうと思ったのがきっかけでした。

## DEMO
- 品目の追加
[![Image from Gyazo](https://i.gyazo.com/5ee7c62bb4902602dd4cd79f581b7cca.gif)](https://gyazo.com/5ee7c62bb4902602dd4cd79f581b7cca)
- タグをクリックすると関連する品目の表示
[![Image from Gyazo](https://i.gyazo.com/2117de9b00364a61830905cf6f413540.gif)](https://gyazo.com/2117de9b00364a61830905cf6f413540)

## 実装予定の内容
- 在庫の追加
- 品目の編集、削除
- タブ一覧表示
- 検索機能（インクリメンタルサーチ）
- レスポンシブ（タブレットサイズ）

## DB設計

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
