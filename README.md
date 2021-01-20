## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| katakana_surname | string | null: false |
| katakana_name    | string | null: false |
| date             | string | null: false |

- has_many :items

## items テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| image       |        |             |
| title       | string | null: false |
| information | text | null: false   |
| category    | string | null: false |
| status      | text | null: false   |
| fee         | string | null: false |
| area        | string | null: false |
| days        | string | null: false |
| price       | string | null: false |

- belongs_to :user

## purchases テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item


## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post         | string     | null: false |
| ken          | string     | null: false |
| city         | string     | null: false |
| banti        | text       | null: false |
| building     | string     | null: false |
| phone_number | string     | null: false |
| purchase_id  | references | null: false, foreign_key: true |

- belongs_to : purchase