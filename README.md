# README

## アプリ名
- 在庫管理アプリ（仮）

## 概要
- 飲食店向けの在庫の把握と、記帳をメインに設計しています。
- 品目と数量と単位と画像を入力して在庫の管理をする。
- タグを自身で設定でき、カテゴリごとに絞り込んで表示ができる

## 作成の背景
前職が調理師で、在庫管理が苦手で、材料の補充忘れや棚卸しでかなり時間がかかっていたこともあり、
過去の自分を対象にスマホなどですぐに、在庫の状態を確認できるアプリを作ろうと思ったのがきっかけでした。

## DEMO
- ログイン

- 品目の追加
[![Image from Gyazo](https://i.gyazo.com/5ee7c62bb4902602dd4cd79f581b7cca.gif)](https://gyazo.com/5ee7c62bb4902602dd4cd79f581b7cca)
- タグをクリックすると関連する品目の表示
[![Image from Gyazo](https://i.gyazo.com/2117de9b00364a61830905cf6f413540.gif)](https://gyazo.com/2117de9b00364a61830905cf6f413540)

## 苦労した点
- ログイン機能：メールアドレスを入れずにログインできるようにしたかった、
- タグ機能：一覧画面にタグを表示させたかったが〇〇な状態になるなど苦戦しまだ実装できていない。

## 実装予定の内容
- 在庫の追加
- 品目の編集、削除
- タグ一覧表示
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
