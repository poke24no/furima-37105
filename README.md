# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Colum           | Type      | Option                        |
| --------------- | --------- | ----------------------------- |
| item_name       | string    | null :false                   |
| explanation     | text      | null :false                   |
| category        | text      | null :false                   |
| status          | string    | null :false                   |
| price           | integer   | null :false                   |
| shipment_source | integer   | null :false                   |
| days            | integer   | null :false                   |
| user            | references| null :false foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

##  buyers テーブル

| Colum           | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| address         | references | null :false foreign_key: true  |
| prototype       | references | null :false foreign_key: true  |
| user            | references | null :false foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Colum           | Type      | Option                        |
| --------------- | --------- | ----------------------------- |
| add_number      | integer   | null :false                   |
| prefecture      | string    | null :false                   |
| city            | string    | null :false                   |
| address         | string    | null :false                   |
| building        | string    |                               |
| telephone       | integer   | null :false                   |

### Association

- belongs_to :buyer