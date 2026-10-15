class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true

  validates :file_name, presence: true
end
