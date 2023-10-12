class Proposition < ApplicationRecord
  before_save {self.name = self.name.capitalize}
  validates :name, length: {minimum: 3, maximum: 30}
end
