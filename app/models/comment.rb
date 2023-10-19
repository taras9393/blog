class Comment < ApplicationRecord
  scope :sort_by_created_at, -> { order(created_at: :desc) }

  belongs_to :user
  belongs_to :article
  validates :body, presence: true
end
