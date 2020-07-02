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
# fleamarket_sample_73e DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :items
- has_one :profile
- has_one :address
- has_one :credit_card

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture_id|references|null: false, foreign_key: true|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|telephone_number|integer|unique: true|
### Association
- belongs_to :user
- belongs_to :prefectue

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
### Association
- belongs_to :user

## prefecturesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :addresses
- has_many :items

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null :false|
|content|text|null :false|
|category_id|references|null: false, foreign_key: true|
|condition|integer|null: false|
|brand|string||
|size|string||
|preparation_day|integer|null: false|
|postage_type|integer|null: false|
|postage_payer|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|prefecture_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :prefecture
- belongs_to :category
- has_many :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
## Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :items


