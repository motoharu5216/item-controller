# README

## アプリ名
- 在庫管理アプリ（仮）
- URL https://shielded-oasis-74769.herokuapp.com/
- ログインID test
- パスワード　12345678

## 概要
- 飲食店向けの在庫の把握と、記帳をメインに設計しています
- 品目と数量と単位と画像を入力して在庫の管理をする
- タグを設定でき、カテゴリごとに絞り込んで表示ができる

## 作成の背景
調理師のころ在庫管理が苦手で、材料の補充忘れや棚卸しでかなり時間がかかっていました。
なので過去の自分を対象にスマホなどですぐに、在庫の状態を確認できるアプリを作ろうと思いました。

## DEMO
- アカウント登録、ログイン画面
[![Image from Gyazo](https://i.gyazo.com/f330560e2635c5372bca072a5410626e.png)](https://gyazo.com/f330560e2635c5372bca072a5410626e)

- 品目の追加
[![Image from Gyazo](https://i.gyazo.com/5ee7c62bb4902602dd4cd79f581b7cca.gif)](https://gyazo.com/5ee7c62bb4902602dd4cd79f581b7cca)

- タグをクリックすると関連する品目の表示
[![Image from Gyazo](https://i.gyazo.com/2117de9b00364a61830905cf6f413540.gif)](https://gyazo.com/2117de9b00364a61830905cf6f413540)

## 苦労した点
- タグ機能：左側の一覧画面にタグを表示させたかったが、同じタグ名が複数表示されてしまう状態になるなど苦戦し、まだ実装できていない。

## 工夫した点
- ログイン機能：メールアドレスを入力しなくても登録、ログインできるようにしました。

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
