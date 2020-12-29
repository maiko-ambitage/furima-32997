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


##  ordersテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------  |
| user          | references | null: false,foreign_key: true|
| item          | references | null: false,foreign_key: true| 
### Associations
- belongs_to : item
- has_one :address
- belongs_to :user


## addresses

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| addresses     | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |
### Associations
belongs_to :order

