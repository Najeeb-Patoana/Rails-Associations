class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  # One-to-one through a polymorphic attachment
  has_one :attachment,
          as: :attachable,
          dependent: :destroy

  # Polymorphic likes
  has_many :likes,
           as: :likeable,
           dependent: :destroy

  validates :title, presence: true
end
