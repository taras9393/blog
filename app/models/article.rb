class Article < ApplicationRecord
  scope :published, -> { where('published_at <= ?', DateTime.now) }
  scope :sort_by_likes_count, -> { order(cached_votes_up: :desc) }
  scope :sort_by_created_at, -> { order(created_at: :desc) }

  belongs_to :user
  belongs_to :category

  mount_uploader :picture, PictureUploader
  acts_as_votable

  validates :content, length: {minimum: 250}, presence: true
  validates :title, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 50}
  validates :user_id, :category_id, :published_at, presence: true

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      Article.all
    end
  end

end
