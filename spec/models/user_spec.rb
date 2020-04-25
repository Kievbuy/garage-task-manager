require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user)    { build(:user) }

  it "is valid with valid attributes" do
    expect(User.new(email: 'test@tester.com', password: 'password')).to be_valid
  end

  it "is not valid without a email" do
    expect(User.new(email: nil, password: 'password')).to_not be_valid
  end

  describe "ActiveModel validations" do
    it { should validate_presence_of(:email) }
  end

  describe "ActiveRecord associations" do
    it { should have_many(:projects) }
    it { should have_many(:tasks) }
  end
end