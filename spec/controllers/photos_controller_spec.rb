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
      expect(assigns(:photos)).to include(photo1, photo2)
    end
  end

  describe 'GET #show' do
    it 'responds succesfully and renders show template' do
      photo = create(:photo)

      get :show, params: { id: photo.id }
      expect(response).to be_successful
      expect(response).to render_template(:show)
    end

    it 'correctly assign photo to @photo' do
      photo = create(:photo)
      get :show, params: {id: photo.id }
      expect(assigns(:photo)).to eq photo
    end
  end

  describe 'GET #new' do
    it 'responds succesfully and renders new template' do
      get :new
      expect(response).to be_successful
      expect(response).to render_template(:new)
    end

    it 'assigns a new photo to @photo' do
      get :new
      expect(assigns(:photo)).to be_a_new(Photo)
    end
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
