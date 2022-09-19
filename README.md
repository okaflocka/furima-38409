# テーブル設計

## users テーブル

| Column             | Type   | Options                     |
| ------------------ | ------ | --------------------------- |
| nickname           | string | null: false                 |
| email              | string | null: false, unique: true   |
| encrypted_password | string | null: false                 |
| first_name         | string | null: false                 |
| last_name          | string | null: false                 |
| first_name_kana    | string | null: false                 |
| last_name_kana     | string | null: false                 |
| birthday           | date   | null: false                 |

### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| title              | string       | null: false |
| content            | text         | null: false |
| category_id        | integer      | null: false |
| condition_id       | integer      | null: false |
| shipping_fee_id    | integer      | null: false |
| shipping_area_id   | integer      | null: false |
| shipping_days_id   | integer      | null: false |
| price              | integer      | null: false |
| user               | references   | null: false |

### Association
- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| user               | references   | null: false |
| item               | references   | null: false |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address


## address テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| purchase           | references   | null: false |
| zipcode            | string       | null: false |
| prefecture_id      | integer      | null: false |
| city               | string       | null: false |
| address_num        | string       | null: false |
| name_building      | string       |             |
| phone_number       | string       | null: false |

### Association
- belongs_to :purchase