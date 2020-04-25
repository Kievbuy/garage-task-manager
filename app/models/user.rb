class User < ApplicationRecord
  acts_as_paranoid

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :email, presence: true
end
