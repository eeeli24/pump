require 'rails_helper'

feature 'user visits homepage' do
  scenario 'sees welcome page when not logged in' do
    visit root_path

    expect(page).to have_css 'h1', text: 'Welcome'
  end

  scenario 'sees resources index when logged in' do
    @user = create :user
    login_as @user

    visit root_path

    expect(page).to have_css 'h1', text: 'Resources'
  end
end
