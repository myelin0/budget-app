require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include Devise::Test::IntegrationHelpers
  let(:user) { User.create(name: 'user', email: 'example@mail.com', password: 'password') }
  let(:category) do
    Category.create(name: 'Category', icon: 'icon.png', created_at: Time.now,
                 updated_at: Time.now, user_id: user.id)
  end

  describe 'GET /categories' do
    before(:each) do
      sign_in user
      get '/categories/'
    end

    it 'test the response status' do
      expect(response).to have_http_status(200)
    end
    it 'Test If the correct template was rendered' do
      expect(response).to render_template(:index)
    end
  end
end
