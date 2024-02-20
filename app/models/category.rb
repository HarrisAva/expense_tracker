class Category < ApplicationRecord
    has_many :expenses
    has_many :users, through: :expenses

    validates :name, presence: true, length: {maximum: 50}
end
