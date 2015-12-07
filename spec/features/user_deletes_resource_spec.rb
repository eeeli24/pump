require 'rails_helper'

feature 'user deletes resource' do

  background do
    @resource = create :resource
    @user = @resource.user
  end

  scenario 'from resources index' do
    login_as @user
    visit resources_path

    click_on 'Delete'

    expect(page).not_to display_resource(@resource)
  end

  scenario 'from resource show' do
    login_as @user
    visit resources_path
    click_on @resource.title

    click_on 'Delete'

    expect(page).not_to display_resource(@resource)
  end
end
