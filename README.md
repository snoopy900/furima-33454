## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| encrypted_password        | string | null: false |
| last_name        | string | null: false |
| first_name       | string | null: false |
| katakana_surname | string | null: false |
| katakana_name    | string | null: false |
| birthday         | date   | null: false |

- has_many :items
- has_one  :address

## items テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| title       | string | null: false |
| information | text   | null: false   |
| category_id    | string | null: false |
| status      | text   | null: false   |
| fee         | integer | null: false |
| area        | string | null: false |
| days        | string | null: false |
| price       | integer | null: false |

- belongs_to :user

## purchases テーブル

| Column    | Type       | Options                        |
| ----------| ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item


## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post         | string     | null: false |
| ken          | string     | null: false |
| city         | string     | null: false |
| banti        | integer       | null: false |
| building     | integer     | null: false |
| phone_number | integer     | null: false |
| purchase  | references | null: false, foreign_key: true |

- belongs_to : purchase