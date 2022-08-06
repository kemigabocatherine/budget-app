require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Cathy', email: 'cathy@gmail.com', password: 'goodGod') }

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have an email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'should have a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'password should have less than 50 characters but greater than 5 characters' do
    subject.name = ('a' * 60) && subject.name = 'a' * 2
    expect(subject).to_not be_valid
  end
end