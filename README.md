# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false ,unique：true|
| encrypted_password | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

## Association
has_many :prototypes
has_many :comments
## comments テーブル

| Column     | Type       | Options                       |
| ------     | ------     | -----------------             |
| user       | references | null: false, foreign_key: true|
| content    | text       | null: false, foreign_key: true|
| prototype  | references | null: false,                  |

## Association
belongs_to :user
belongs_to :prototype
## prototypes テーブル

| Column     | Type           | Options                        |
| ------     | ----------     | ------------------------------ |
| title      | string         | null: false,                   |
| catch_copy | string         | null: false,                   |
| concept    | string         | null: false,                   |
| user       | references     | null: false, foreign_key: true |

## Association
belongs_to :user
has_many :comments