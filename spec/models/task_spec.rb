require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(build(:task)).to be_valid
  end

  let(:user)    { build(:user) }
  let(:project) { build(:project, user: user) }
  let(:task)    { build(:task, user: user, project: project) }

  it "is valid with valid attributes" do
    expect(Task.new(name: 'Test', user: user, project: project)).to be_valid
  end

  it "is not valid without a name" do
    expect(Task.new(name: nil, user: user, project: project)).to_not be_valid
  end

  describe "ActiveModel validations" do
    it { should validate_presence_of(:name) }
  end

  describe "ActiveRecord associations" do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
  end

  describe "scopes" do
    let!(:unfinished_task) { create(:task, user: user, project: project) }
    let!(:finished_task)   { create(:task, user: user, project: project, is_done: true) }

    it ".finished returns all finished tasks" do
      expect(Task.finished.first).to eq(finished_task)
    end

    it ".pending returns all not finished tasks" do
      expect(Task.pending.first).to eq(unfinished_task)
    end
  end

  describe "public instance methods" do
    context "responds to its methods" do
      it { should respond_to(:done?) }
    end

    context "executes methods correctly" do
      context "#method name" do
        let(:task) { build(:task) }

        it "return the value of is_done field" do
          expect(task.done?).to eq(false)
        end
      end
    end
  end
end