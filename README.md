# README

#テーブル設計

## users テーブル

| Column              | Type   | options                   |
|---------------------|--------|---------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| user_last_name      | string | null: false               |
| user_first_name     | string | null: false               |
| user_last_name_add  | string | null: false               |
| user_first_name_add | string | null: false               |
| birthday            | date   | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column              | Type       | options                        |
|---------------------|------------|--------------------------------|
| item_name           | string     | null: false                    |
| item_description    | text       | null: false                    |
| item_category_id    | integer    | null: false                    |
| item_condition_id   | integer    | null: false                    |
| delivery_charge_id  | integer    | null: false                    |
| from_id             | integer    | null: false                    |
| date_of_delivery_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column             | Type       | options                        |
|--------------------|------------|--------------------------------|
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | options                        |
|--------------------|------------|--------------------------------|
| postal_code        | string     | null: false                    |
| from_id            | integer    | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :order