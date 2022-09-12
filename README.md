# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| title              | string | null: false |
| content            | string | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| shipping_fee       | string | null: false |
| shipping_area      | string | null: false |
| shipping_days      | string | null: false |
| price              | integer| null: false |

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| zipcode            | integer| null: false |
| ship_prefecture    | string | null: false |
| ship_city          | string | null: false |
| ship_address       | string | null: false |
| ship_name_building | string | null: false |
| phone_number       | string | null: false |

### Association

- belongs_to :user
- belongs_to :item