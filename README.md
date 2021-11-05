# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| name               | string  | null: false              |
| email              | string  | null: false unique: true |
| encrypted_password | string  | null: false              | 
| birthday           | date    | null: false              |
| first_name         | string  | null: false              |
| family_name        | string  | null: false              |
| first_name_rub     | string  | null: false              |
| family_name_rub    | string  | null: false              |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Colum              | Type      | Option                        |
| ------------------ | --------- | ----------------------------- |
| item_name          | string    | null :false                   |
| explanation        | text      | null :false                   |
| category_id        | integer   | null :false                   |
| status_id          | integer   | null :false                   |
| price              | integer   | null :false                   |
| load_id            | integer   | null :false                   |
| prefecture_id      | integer   | null :false                   |
| day_id             | integer   | null :false                   |
| user               | references| null :false foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

##  buyers テーブル

| Colum           | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| item            | references | null :false foreign_key: true  |
| user            | references | null :false foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Colum           | Type       | Option                        |
| --------------- | ---------- | ----------------------------- |
| add_number      | string     | null :false                   |
| prefecture_id   | integer    | null :false                   |
| city            | string     | null :false                   |
| address         | string     | null :false                   |
| building        | string     |                               |
| telephone       | string     | null :false                   |
| buyer           | references | null :false foreign_key: true |

### Association

- belongs_to :buyer