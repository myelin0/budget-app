require 'rails_helper'
RSpec.describe 'categories/index', type: :feature do
  before :each do
    @user = User.create(name: 'Felix Ouma', email: "#{DateTime.now.to_i}@gmail.com", password: 'password',
                        password_confirmation: 'password')
    @category = @user.categories.create(name: 'category 1', icon: 'http://localhost:3000/icon.png', user_id: @user.id)

    visit(new_user_session_path)
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
  end

  describe "Visit categorys' index page" do
    it 'should have category header' do
      visit(categories_path)
      expect(page).to have_text('TRANSACTIONS')
    end

    it 'should have category name' do
      visit(new_category_path)
      expect(page).to have_text('New Category')
    end

    it 'should have category icon' do
      visit(new_category_path)
      expect(page).to have_text('Icon')
    end

    it 'should have new page link' do
      visit(new_category_path)
      expect(page).to have_selector(:link_or_button, 'Back to categories', exact: true)
    end

    it 'redirect to add new category' do
      visit(categories_path)
      click_link('New category', exact: true)
      expect(page).to have_current_path(new_category_path)
    end
  end
end
