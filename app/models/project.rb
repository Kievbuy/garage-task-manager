class Project < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end