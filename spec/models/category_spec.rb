require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'user', email: 'example@mail.com', password: 'password') }
  subject do
    described_class.new(name: 'Category', icon: 'profile-img.jpg', user_id: user.id)
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
      subject.name = 'Category'
      expect(subject).to be_valid
    end
  end
end
