class User < ApplicationRecord
  # One-to-many: User -> Posts
  has_many :posts, dependent: :destroy

  # One-to-many: User -> Articles
  has_many :articles, dependent: :destroy

  # Comments written by this user
  has_many :comments, dependent: :destroy

  # Has-many-through: comments on this user's articles
  has_many :article_comments,
           through: :articles,
           source: :comments

  # Polymorphic likes
  has_many :likes, dependent: :destroy

  # Many-to-many
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
