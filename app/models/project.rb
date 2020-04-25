class Project < ApplicationRecord
  acts_as_paranoid
  
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
end