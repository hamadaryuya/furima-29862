# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| ----------------| --------| ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| family_name     | string  | null: false |
| given_name      | string  | null: false |
| family_name_kana| string  | null: false |
| given_name_kana | string  | null: false |
| birth           | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column      | Type         | Options                       |
| ---------------| -------------| ------------------------------|
| name           | string       | null: false                   |
| discription    | text         | null: false                   |
| price          | integer      | null: false                   |
| category_id    | integer      | null: false                   |
| condition_id   | integer      | null: false                   |
| delivery_fee_id| integer      | null: false                   |
| area_id        | integer      | null: false                   |
| ship_days_id   | integer      | null: false                   |
| user           | references   | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_many   :comments
- has_one    :order
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

## ordersテーブル

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
| postal_code  | string       | null: false                   |
| municipality | string       | null: false                   |
| house_number | string       | null: false                   |
| building_name| string       |                               |
| phone_number | string       | null: false                   |
| area_id      | integer      | null: false                   |
| order        | references   | null: false, foreign_key:true |

### Association

- belongs_to_active_hash :area
- belongs_to :order