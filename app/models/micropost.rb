class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 64 }
  mount_uploader :file, AudiofileUploader
  validates :file, presence: true
end
