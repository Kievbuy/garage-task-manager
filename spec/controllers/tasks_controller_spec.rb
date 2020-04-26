require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  describe '#new' do
    sign_me_in

    it 'returns a success responce' do
      get :new

      expect(response.status).to eq(200)
    end
  end

  describe '#edit' do
    sign_me_in

    it 'returns a success responce' do
      project = create(:project, user: @current_user)
      task = create(:task, project: project, user: @current_user)

      get :edit, params: { id: task.id }

      expect(response.status).to eq(200)
    end
  end
end
