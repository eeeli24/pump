require 'rails_helper'

describe '#mark_complete' do
  it 'updates completed_at with current time' do
    resource = create :resource

    resource.mark_complete
    resource.reload

    expect(resource).to be_completed
  end
end

describe '#completed?' do
  it 'is truthy when completed_at is set' do
    resource = create :resource

    resource.mark_complete
    resource.reload

    expect(resource.completed?).to be_truthy
  end

  it 'is falsey when completed_at is not set' do
    resource = create(:resource, completed_at: Time.current)

    resource.mark_incomplete
    resource.reload

    expect(resource.completed?).not_to be_truthy
  end
end

describe '#mark_incomplete' do
  it 'updates complete_at with nil' do
    resource = create(:resource, completed_at: Time.current)

    resource.mark_incomplete

    expect(resource.completed_at).to be_nil
  end
end
