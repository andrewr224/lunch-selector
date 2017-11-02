require 'rails_helper'

RSpec.describe MenusController, type: :controller do
  describe 'GET #index' do
    it 'returns success response' do
      get :index
      expect(response).to be_ok
    end
  end

  describe 'GET #show' do
    it 'returns success response' do
      menu = Menu.create!
      get :show, params: { id: menu.to_param }
      expect(response).to be_ok
    end
  end

  describe 'POST #create' do
    it 'creates a new menu' do
      post :create
      expect(flash[:notice]).to eq('Menu created!')
    end
  end

  describe 'GET #edit' do
    it 'returns success response' do
      menu = Menu.create!
      get :edit, params: { id: menu.to_param }
      expect(response).to be_ok
    end
  end

  describe 'PUT #update' do
    it 'updates the menu' do
      menu = Menu.create!
      put :update, params: { id: menu.to_param }
      expect(flash[:notice]).to eq('Menu updated!')
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the menu' do
      menu = Menu.create!
      delete :destroy, params: { id: menu.to_param }
      expect(flash[:notice]).to eq('Menu destroyed!')
    end
  end
end
