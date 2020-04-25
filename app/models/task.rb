class Task < ApplicationRecord
  acts_as_paranoid
  enum status: %i[pending completed]
  
  belongs_to :project

  validates :name, presence: true
  validates :priority, inclusion: 1..10
end