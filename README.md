# README
# テーブル設計

## users テーブル

| colum      |type         | options      |
|:-----------|------------:|:------------:|
| nickname   | string      | null: false  |
| email      | string      | null: false,unique:true  |
| encrypted_password| string      | null: false  |
| last_name  | string      | null: false  |
| first_name | string       | null: false  |
| last_name_kana    | string       | null: false  |
| first_name_kana   | string      | null: false  |
| birthday          | date        | null: false  |

### Association
- has_many : items
- has_many : orders




## items テーブル

| Column                   | Type       | Options                        |
| -------------------------| ---------- | ------------------------------ |
|                          |            |                                |
| name                     | string     | null: false                    |
| info                     | text       | null: false                    |
| category_id              | integer    | null: false                    |
| status_id                | integer    | null: false                    |
| shipping_fee_status_id   | integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| prepare_days_id    | integer    | null: false                    |
| price                    | integer    | null: false                    |
| user                     | references | null:false,foreign_key: true   |

### Associations
- belongs_to :user
- has_one  :order
- has_one  :category
- has_one  :status
- has_one  :shipping_fee_status
- has_one  :prefecture
- has_one  :prepare_days

##  ordersテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------  |
| user          | references | null: false,foreign_key: true|
| sold_out_item | references | null: false,foreign_key: true| 
### Associations
- belongs_to : item
- has_one :address
- belongs_to :user


## addresses

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| postal-code   | text       | null: false |
| prefecture_id | integer    | null: false |
| city          | string       | null: false |
| addresses     | string     | null: false |
| building      | string     |             |
| phone-number  | string     | null: false |
### Associations
belongs_to :orders

## prefectures

| Column        | Type       | Options     |
| ------------- | ---------- | ----------  |
| prefecture    | integer    | null: false |
belongs_to :items
belongs_to :addresses

## categories
| Column         | Type       | Options    |
| ---------------| ---------- | ---------- |
| category       | integer    | null:false |
### Associations
belongs_to :items

## categories
| Column         | Type       | Options    |
| ---------------| ---------- | ---------- |
| category       | integer    | null:false |
### Associations
belongs_to :items

## status

| Column         | Type       | Options    |
| ---------------| ---------- | ---------- |
| status         | integer    | null:false |
### Associations
belongs_to :items

## shipping_fee_status

| Column         | Type       | Options    |
| ---------------| ---------- | ---------- |
| shipping_fee_status | integer    | null:false |
### Associations
belongs_to :items

## prepare_days

| Column         | Type       | Options    |
| ---------------| ---------- | ---------- |
| prepare_days   | integer    | null:false |
### Associations
belongs_to :items


