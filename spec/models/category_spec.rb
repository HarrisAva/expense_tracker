require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validations" do

    it 'is not valid without a name' do
      category = build(:category, name:nil)
      expect(category).not_to be_valid
    end
  end
end
