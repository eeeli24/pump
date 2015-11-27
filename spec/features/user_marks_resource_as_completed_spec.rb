require 'rails_helper'

feature 'user marks resource as completed' do
  scenario 'from resources index followed by marking incomplete' do
    resource = create :resource
    user = resource.user

    login_as user
    visit resources_path
    click_on 'Mark complete'

    expect(page).to display_completed_resource(resource)

    click_on 'Mark incomplete'

    expect(page).to display_incompleted_resource(resource)
  end

  scenario 'from resources show followed by marking incomplete' do
    resource = create :resource
    user = resource.user

    login_as user
    visit resources_path
    click_on resource.title
    click_on 'Mark complete'

    visit resources_path
    expect(page).to display_completed_resource(resource)

    click_on resource.title
    click_on 'Mark incomplete'

    visit resources_path
    expect(page).to display_incompleted_resource(resource)
  end
end
