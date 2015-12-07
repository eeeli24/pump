require 'rails_helper'

feature 'user edits a resource' do
  scenario 'successfully' do
    resource = create :resource
    user = resource.user

    login_as user
    visit resources_path
    click_on resource.title

    click_on 'Edit'

    fill_in 'Title', with: 'A different tutorial'
    fill_in 'Description', with: 'Teaches some other things'

    click_on 'Submit'

    expect(page).to have_content 'A different tutorial'
    expect(page).to have_content 'Teaches some other things'
  end
end
