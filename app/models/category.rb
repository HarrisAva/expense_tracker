class Category < ApplicationRecord
    
    # Association
    has_many :expenses
    has_many :users

    # Validation
    validates :name, presence: true, length: {maximum: 50}
end
