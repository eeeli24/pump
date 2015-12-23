require 'rails_helper'

feature 'user adds a note' do
  scenario 'successfully' do
    resource = create :resource
    user = resource.user

    login_as user
    visit resource_path(resource)

    fill_in 'Add note', with: 'What an amazing resource'
    click_on 'Add'

    expect(page).to have_content 'What an amazing resource'

    visit resources_path

    expect(page).to have_content 'Notes(1)'
  end
end
