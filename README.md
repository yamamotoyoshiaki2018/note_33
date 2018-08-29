# 概要

## アプリケーション説明

文章、写真、イラストなどの作品を投稿して、クリエイターとユーザーをつなぐことができるウェブサービス

## 詳細

作れる投稿の種類は3つ

- トーク
短文テキストと画像1枚が投稿できる。他のユーザーと会話をするための投稿

- テキスト
一般的なブログのような記事の作成・投稿

- イメージ
写真やイラストを手軽に投稿。1記事で最大5枚のイメージを投稿可能

- マガジンについて
複数の投稿をたばねて「マガジン」にすることが可能
自分の投稿をたばねてカテゴリー別に分類したり、また、他の人の作成した投稿をたばねて、キュレーションメディアを作ることも可能

# DB設計

## users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|note33_id|string||
|header_image|string||
|avatar_image|string||
|self_introduction|text||


### Associations
- has_many :notes
- has_many :follows, dependent: :destroy


## notes table

|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|post_talk_id|references :post_talk|foreign_key: true|
|post_text_id|references :post_text|foreign_key: true|
|post_image_id|references :post_image|foreign_key: true|
|publish_status|integer|null: false|

### Associations
- belongs_to :user
- has_many :post_talks
- has_many :post_texts
- has_many :post_images
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :tags, through: :tag_notes
- has_many :magazines, through: :magazine_notes


## post_talks table

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string||


### Associations
- belongs_to :note


## post_texts table

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text||
|header_image|string||
|image|string||


### Associations
- belongs_to :note


## post_images table

|Column|Type|Options|
|------|----|-------|
|title|string||
|image_description|text||
|image|string|null: false|


### Associations
- belongs_to :note


## comments table

|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|note_id|references :note|null: false, foreign_key: true|
|text|text|null: false|

### Associations
- belongs_to :note


## likes table

|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|note_id|references :note|null: false, foreign_key: true|

### Associations
- belongs_to :note


## tags table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Associations
- has_many :notes, through: :tag_notes


## tag_notes table

|Column|Type|Options|
|------|----|-------|
|tag_id|references :tag|null: false, foreign_key: true|
|note_id|references :note|null: false, foreign_key: true|

### Associations
- belongs_to :tag
- belongs_to :note


## magazines table

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|magazine_description|text||
|header_image|string||
|author_id|integer||
|publish_status|integer|null: false|

### Associations
- has_many :notes, through: :magazine_notes


## magazine_notes table

|Column|Type|Options|
|------|----|-------|
|magazine_id|references :magazine|null: false, foreign_key: true|
|note_id|references :note|null: false, foreign_key: true|

### Associations
- belongs_to :magazine
- belongs_to :note


## follows table

|Column|Type|Options|
|------|----|-------|
|user_id|references :user|null: false, foreign_key: true|
|followed_id|integer|null: false|

### Associations
- belongs_to :user
