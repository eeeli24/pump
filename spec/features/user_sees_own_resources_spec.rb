require 'rails_helper'

feature 'user sees own resources' do

  background do
      @user = create :user
      @other_user_resource = create :resource, :other_user_resource
  end

  scenario "but not the others'" do
    login_as @user
    visit resources_path

    click_on 'Add resource'
    fill_in 'Title', with: 'A programming tutorial'
    click_on 'Add'

    visit resources_path
    expect(page).to have_content 'A programming tutorial'
    expect(page).not_to have_content @other_user_resource.title
  end
end
