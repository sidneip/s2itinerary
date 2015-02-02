require 'rails_helper'

RSpec.describe Api::V1::MapsController, :type => :controller do 
  let(:valid_session) { {} }

  before :each do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe '#create' do 
    it 'valid map' do
      post :create, {map: {name: 'araraquara'}}, valid_session
      expect(response).to have_http_status(:ok)
    end

    it 'invalid map' do
      post :create, {map: {name: nil}}, valid_session
      expect(response).to have_http_status(:unprocessable_entity)
    end

  end
end