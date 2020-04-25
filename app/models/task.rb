class Task < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :project
  belongs_to :user

  validates :name, presence: true
  validates :priority, inclusion: 1..10

  scope :finished, -> { where(is_done: true) }
  scope :pending, -> { where(is_done: false) }

  def done?
    is_done
  end
end