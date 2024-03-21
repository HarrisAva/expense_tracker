class Expense < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :category
  # has_one :category
  # has_and_belongs_to_many :category
  
  # Validation
  validates :date, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :amount, presence: true
  # validates :category, presence: true
end
