# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| ----------------| ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| family_name     | string | null: false |
| given_name      | string | null: false |
| family_name_kana| string | null: false |
| given_name_kana | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column      | Type         | Options                       |
| ------------| -------------| ------------------------------|
| seller      | string       | null: false                   |
| name        | string       | null: false                   |
| image       | text         | null: false                   |
| discription | text         | null: false                   |
| price       | integer      | null: false                   |
| category    | integer      | null: false                   |
| condition   | integer      | null: false                   |
| delivery_fee| integer      | null: false                   |
| area        | integer      | null: false                   |
| ship_days   | integer      | null: false                   |
| user        | references   | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many   :comments
- has_one    :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :area
- belongs_to_active_hash :ship_days


## comments テーブル

| Column      | Type         | Options                       |
| ------------| -------------| ------------------------------|
| text        | text         | null: false                   |
| user        | references   | null: false, foreign_key: true|
| item        | references   | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## purchasesテーブル

| Column       | Type         | Options                       |
| -------------| -------------| ------------------------------|
| user         | references   | null: false, foreign_key: true|
| item         | references   | null: false, foreign_key: true|

### Association

- has_one :address
- belongs_to :user
- belongs_to :item 

## addressesテーブル

| Column       | Type         | Options                       |
| -------------| -------------| ------------------------------|
| postal_code  | integer      | null: false                   |
| house_number | string       | null: false                   |
| municipality | string       | null: false                   |
| building_name| string       |                               |
| phone_number | integer      | null: false                   |
| area         | integer      | null: false                   |

### Association

- belongs_to_active_hash :area
- belongs_to :purchase