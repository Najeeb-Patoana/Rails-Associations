class Comment < ApplicationRecord
  belongs_to :user

  # A comment can belong to a post...
  belongs_to :post, optional: true

  # ...or an article.
  belongs_to :article, optional: true

  # Self-association: this comment can have a parent.
  belongs_to :parent_comment,
             class_name: "Comment",
             optional: true,
             inverse_of: :replies

  # Self-association: this comment can have many replies.
  has_many :replies,
           class_name: "Comment",
           foreign_key: :parent_comment_id,
           dependent: :destroy,
           inverse_of: :parent_comment

  validates :body, presence: true

  validate :belongs_to_exactly_one_content

  private

  def belongs_to_exactly_one_content
    if post_id.present? == article_id.present?
      errors.add(:base, "A comment must belong to either a post or an article")
    end
  end
end
