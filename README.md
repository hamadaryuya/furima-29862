# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ------------| ------ | ----------- |
| nickname    | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| given_name  | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :buyers

## items テーブル

| Column      | Type         | Options                       |
| ------------| -------------| ------------------------------|
| seller      | string       | null: false                   |
| name        | string       | null: false                   |
| image       | text         | null: false                   |
| discription | text         | null: false                   |
| price       | integer      | null: false                   |
| user        | references   | null: false, foreign_key: true|

- belongs_to :user
- has_many   :comments
- has_one    :buyers

## comments テーブル

| Column      | Type         | Options                       |
| ------------| -------------| ------------------------------|
| text        | text         | null: false                   |
| user        | references   | null: false, foreign_key: true|
| item        | references   | null: false, foreign_key: true|

- belongs_to :user
- belongs_to :item

## buyersテーブル

| Column       | Type         | Options                       |
| -------------| -------------| ------------------------------|
| postal_code  | integer      | null: false                   |
| address      | string       | null: false                   |
| municipality | string       | null: false                   |
| building_name| references   |                               |
| phone_number | integer      | null: false                   |
| user         | references   | null: false, foreign_key: true|
| item         | references   | null: false, foreign_key: true|

- belongs_to :user
_ belongs_to :item 