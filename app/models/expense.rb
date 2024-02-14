class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  # Varidation
  validates :date, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :description, length: {maximum: 255}
  validates :amount, presence: true
  validates :category, presence: true
end
