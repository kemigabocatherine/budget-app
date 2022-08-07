require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(name: 'Home', icon: 'logos:netflix-icon') }

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
