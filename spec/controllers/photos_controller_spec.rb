require 'rails_helper'

describe PhotosController do
  describe 'GET #index' do
    it 'responds succesfully and renders index template' do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end

    it 'populates array of photos' do
      photo1 = create(:photo)
      photo2 = create(:photo)

      get :index
      expect(assigns(:photos)).to contain_exactly(photo1, photo2)
    end
  end

  describe 'GET #show' do
  end

  describe 'GET #new' do
  end

  describe 'GET #edit' do
  end

  describe 'POST #create' do
  end

  describe 'PATCH #update' do
  end

  describe 'DELETE #destroy' do
  end

end
