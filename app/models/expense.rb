class Expense < ApplicationRecord

  # Association
  belongs_to :user
  belongs_to :category
  
  # Validation
  validates :date, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :amount, presence: true

end
