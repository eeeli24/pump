require 'rails_helper'

feature 'user filters resources by completion' do

  background do
    @completed_resource = create(:resource, completed_at: Time.current)
    @user = @completed_resource.user
    @incompleted_resource = create(:resource, user: @user, completed_at: nil)
  end

  scenario 'and sees completed resources' do
    login_as @user
    visit resources_path

    click_on 'Completed'

    expect(page).to display_completed_resource(@completed_resource)
    expect(page).not_to display_incompleted_resource(@incompleted_resource)
  end

  scenario 'and sees incompleted resources' do
    login_as @user
    visit resources_path

    click_on 'Not completed'

    expect(page).to display_incompleted_resource(@incompleted_resource)
    expect(page).not_to display_completed_resource(@completed_resource)
  end
end
