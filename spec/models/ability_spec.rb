require 'rails_helper'
require 'cancan/matchers'

describe 'User' do
  describe 'abilities' do
    subject(:ability) { Ability.new(user) }
    let(:user)        { nil }


    context 'able' do
      let(:user){ create(:user) }

      it { should be_able_to(:manage, Project.new(name: 'test', user: user)) }
      it { should be_able_to(:manage, Task.new(name: 'task', project_id: 1, user: user)) }
    end

    context 'disable' do
      let(:user){ create(:user) }

      it { should_not be_able_to(:manage, Project.new(name: 'test')) }
      it { should_not be_able_to(:manage, Task.new(name: 'task', project_id: 1)) }
    end
  end
end
