class Category < ApplicationRecord
    Association
    has_many :expenses
    has_many :users, through: :expenses
    

    # has_and_belongs_to_many :expenses
    # has_many :users, class_name: 'User', foreign_key: 'user_id'

    # Validation
    validates :name, presence: true, length: {maximum: 50}
end
