class Article < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy

  has_one :attachment,
          as: :attachable,
          dependent: :destroy

  has_many :likes,
           as: :likeable,
           dependent: :destroy

  validates :title, presence: true
end
