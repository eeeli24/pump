require 'rails_helper'

feature 'user adds a resource' do

  background do
    @user = create :user
    login_as @user
  end

  scenario 'successfully' do
    visit new_resource_path

    fill_in 'Title', with: 'A programming tutorial'
    fill_in 'Description', with: 'Gonna teach you programming'
    click_on 'Submit'

    expect(page).to have_content 'A programming tutorial'
    expect(page).to have_content 'Gonna teach you programming'
  end

  scenario 'unsuccessfully without providing title' do
    visit new_resource_path

    fill_in 'Description', with: 'A tutorial without a title'
    click_on 'Submit'

    expect(page).to have_content "Title can't be blank"
  end
end
