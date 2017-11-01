require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  context 'GET #index' do
    it 'returns success response' do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET #show' do
    it 'returns success response' do
      menu = Menu.create!
      get :show, params: { id: menu.to_param }
      expect(response).to be_success
    end
  end

  context 'POST #create' do
    it 'responds to html' do
      post :create
      expect(response.content_type).to eq 'text/html'
    end
  end

  context 'GET #edit' do
    it 'returns success response' do
      menu = Menu.create!
      get :edit, params: { id: menu.to_param }
      expect(response).to be_success
    end
  end

  context 'PUT #update' do
    it 'responds to html' do
      menu = Menu.create!
      put :update, params: { id: menu.to_param }
      expect(response.content_type).to eq 'text/html'
    end
  end

  context 'DELETE #destroy' do
    it 'responds to html' do
      menu = Menu.create!
      delete :destroy, params: { id: menu.to_param }
      expect(response.content_type).to eq 'text/html'
    end
  end
end
