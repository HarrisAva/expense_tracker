require 'rails_helper'

RSpec.describe Expense, type: :model do
  
  context 'validations tests' do

    it 'is not valid without a date' do
      expense = build(:expense, date: nil)
      expect(expense).not_to be_valid
    end

    it 'is not valid without an title' do
      expense = build(:expense, title: nil)
      expect(expense).not_to be_valid
    end

    it 'is not valid without an amount' do
      expense = build(:expense, amount: nil)
      expect(expense).not_to be_valid
    end

    it 'is not valid without a category' do
      expense = build(:expense, category: nil)
      expect(expense).not_to be_valid
    end

    it 'is not valid without a password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end
  end

  context "associations tests" do

    it 'belongs to a user' do
      expense = build(:expense)
      expect(expense.user).to be_present
    end

    it 'belongs to a category' do
      expense = build(:expense)
      expect(expense.category).to be_present
    end
  end
end
