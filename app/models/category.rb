class Category < ApplicationRecord
  before_save {self.name = self.name.capitalize}
  has_many :articles
  validates :name, length: {minimum: 3, maximum: 30}, presence: true

end
