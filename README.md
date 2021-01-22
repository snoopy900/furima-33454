## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null:false, unique: true |
| encrypted_password        | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| katakana_surname | string | null: false |
| katakana_name    | string | null: false |
| birthday         | date   | null: false |

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| title       | string | null: false |
| information | text   | null: false   |
| category_id    | integer | null: false |
| status_id      | integer   | null: false   |
| fee_id         | integer | null: false |
| prefecture_id        | integer | null: false |
| day_id        | integer | null: false |
| price       | integer | null: false |
| user       | references | null: false, foreign_key: true |

- belongs_to :user
- has_one  :purchase

## purchases テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one  :address


## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post         | string     | null: false |
| prefecture_id      | integer       | null: false |
| city         | string     | null: false |
| address          | string     | null: false |
| building     | string     |  |
| phone_number | string     | null: false |
| purchase  | references | null: false, foreign_key: true |

- belongs_to : purchase