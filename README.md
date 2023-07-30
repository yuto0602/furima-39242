# README

#テーブル設計

## users テーブル

| Column              | Type   | options                   |
|---------------------|--------|---------------------------|
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| user_last-name      | string | null: false               |
| user_first-name     | string | null: false               |
| user_last-name_add  | string | null: false               |
| user_first-name_add | string | null: false               |
| years               | string | null: false               |
| month               | string | null: false               |
| day                 | string | null: false               |

### Association

- has_many :items
- has_many :orders
- has_one :address

## items テーブル

| Column             | Type       | options                        |
|--------------------|------------|--------------------------------|
| item_name          | string     | null: false                    |
| item_description   | string     | null: false                    |
| item_category      | string     | null: false                    |
| item_condition     | string     | null: false                    |
| delivery_charges   | string     | null: false                    |
| from               | string     | null: false                    |
| date_of_delivery   | string     | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

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

## addresses テーブル

| Column             | Type       | options                        |
|--------------------|------------|--------------------------------|
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| house_number       | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user