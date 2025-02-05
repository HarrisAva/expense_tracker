class User < ApplicationRecord
    has_secure_password 
    
    # Association
    has_many :expenses
    has_many :categories, through: :expenses

    # Validation
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true

end
