class Article < ApplicationRecord

  belongs_to :user
  belongs_to :category
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  acts_as_votable

  validates :content, length: {minimum: 250}, presence: true
  validates :title, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
  validates :user_id, presence: true
  validates :category_id, presence: true

end
