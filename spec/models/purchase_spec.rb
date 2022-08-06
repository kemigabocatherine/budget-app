require 'rails_helper'

RSpec.describe Purchase, type: :model do
  subject { Purchase.new(name: 'Bicycle', amount: 245) }

  before { subject.save }

  it 'should have a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should have an amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'shouls have amount in integers' do
    subject.amount = '234'
    expect(subject).to_not be_valid
  end
end