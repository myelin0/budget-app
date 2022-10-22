require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'user', email: 'example@mail.com', password: 'password') }
  let(:category) do
    Category.create(name: 'Category', icon: 'icon.png', created_at: Time.now,
                 updated_at: Time.now, user_id: user.id)
  end

  subject do
    described_class.new(name: 'name', amount: 20, user_id: user.id, category_id: category.id)
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name' do
      subject.name = 'name'
      expect(subject).to be_valid
    end

    it 'is not valid without an amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with an amount' do
      subject.amount = 20
      expect(subject).to be_valid
    end
  end
end
