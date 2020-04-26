require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe '#index' do
    sign_me_in

    it 'returns a success responce' do
      get :index

      expect(response.status).to eq(200)
    end
  end 

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

      get :edit, params: { id: project.id }

      expect(response.status).to eq(200)
    end
  end
end
