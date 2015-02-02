require 'rails_helper'

RSpec.describe Api::V1::RoutesController, :type => :controller do 
  let(:valid_session) { {} }

  before :each do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe '#create' do
    it 'valid route' do
      Map.create(name: 'araraquara')
      post :create, { route: { map: 'araraquara', origin: 'A', destination: 'B', distance: 10 } }, valid_session
      expect(response).to have_http_status(:ok)
    end

    it 'invalid route' do
      Map.create(name: 'araraquara')
      post :create, { route: { map: 'araraquara', origin: nil } }, valid_session
      expect(response).to have_http_status(:unprocessable_entity)
    end

    it 'invalid map' do
      post :create, { route: { map: nil } }, valid_session
      expect(response).to have_http_status(:not_found)
    end
  end
end
