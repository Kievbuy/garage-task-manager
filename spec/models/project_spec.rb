require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    expect(build(:project)).to be_valid
  end

  let(:user)    { build(:user) }
  let(:project) { build(:project, user: user) }

  it "is valid with valid attributes" do
    expect(Project.new(name: 'Test', user: user)).to be_valid
  end

  it "is not valid without a name" do
    expect(Project.new(name: nil, user: user)).to_not be_valid
  end

  describe "ActiveModel validations" do
    it { should validate_presence_of(:name) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:user) }
    it { should have_many(:tasks) }
  end
end