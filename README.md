# README
# テーブル設計

## users テーブル

| colum      |type         | options      |
|:-----------|------------:|:------------:|
| nickname   | string      | null: false  |
| email      | string      | null: false  |
| password   | string      | null: false  |
| last-name  | string      | null: false  |
| first-name | string       | null: false  |
| last-name-kana    | string       | null: false  |
| first-name-kana   | string      | null: false  |
| birthday          | date        | null: false  |

### Association
- has_many : items




## items テーブル

| Column                   | Type       | Options                        |
| -------------------------| ---------- | ------------------------------ |
|                          |            |                                |
| item-name                | text       | null: false                    |
| item-info                | text       | null: false                    |
| item-category            | string     | null: false                    |
| item-status              | string     | null: false                    |
| item-shipping-fee-status | string     | null: false                    |
| item-prefecture          | string     | null: false                    |
| item-scheduled-delivery  | string     | null: false                    |
| item-prise               | integer    | null: false                    |
| add-tax-price            | integer    | null: false                    |
| profit                   | integer    | null: false                    |
| user                     | references | null:false,foreign_key: true   |

### Associations
- belongs_to :user
- has_one  :order

##  ordersテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------  |
| card-number   | integer    | null: false |
| card-exp-month| integer    | null: false | 
| card-exp-year | integer    | null: false |
| card-cvc      | integer    | null: false |
| card-exp-year | integer    | null: false |
### Associations

- belongs_to : item
- has_one :address

## addresses

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| postal-code   | text       | null: false |
| prefecture    | text       | null: false |
| city          | text       | null: false |
| addresses     | text       | null: false |
| building      | text       | null: false |
| phone-number  | text       | null: false |

### Associations

- belongs_to : address






