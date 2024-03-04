class User < ApplicationRecord
    # give every instance of user 'password and password_confirmation attributes'
    # Association
    has_secure_password 

    has_many :expenses
    has_many :categories, through: :expenses
    # has_many :expenses, class_name: 'Expense', foreign_key: 'user_id'
    # has_many :categories, class_name: 'Category', foreign_key: 'user_id'

    # Validation
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    # validate :validate_username


    private

    # def validate_username
    #     unless username =~ /\A[a-zA-Z0-9_]+\Z/
    #         error.add(:username, "can only contain letters, numbers and underscore")
    #     end
    # end
end
