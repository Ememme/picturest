require 'rails_helper'

describe HomeController do
  describe "GET #index" do
    it 'responds succesfully' do
      get :index
      expect(response).to be_successful
    end

    it 'renders index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #about" do
    it 'responds succesfully' do
      get :about
      expect(response).to be_successful
    end

    it 'renders about template' do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe "GET #terms" do
    it 'responds succesfully' do
      get :terms
      expect(response).to be_successful
    end

    it 'renders terms template' do
      get :terms
      expect(response).to render_template(:terms)
    end
  end







end
