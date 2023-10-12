class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :nickname, length: {maximum: 20}, presence: true, uniqueness: {case_sensitive: false}
  has_many :articles, dependent: :destroy
  acts_as_voter
end
