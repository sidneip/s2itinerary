require 'rails_helper'

RSpec.describe Api::V1::DeliveriesController, :type => :controller do
  let(:valid_session) { {} }

  before :each do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end

  describe '#search' do
    it 'search best route' do
      map = Map.create(name: 'araraquara')
      map.routes.create(origin: 'A', destination: 'B', distance: 10)
      map.routes.create(origin: 'B', destination: 'D', distance: 15)
      map.routes.create(origin: 'A', destination: 'C', distance: 20)
      map.routes.create(origin: 'C', destination: 'D', distance: 30)
      map.routes.create(origin: 'B', destination: 'E', distance: 50)
      map.routes.create(origin: 'D', destination: 'E', distance: 30)
      get :search, { map: 'araraquara', origin: 'A', destination: 'D' }, valid_session
      expect(response.body).to include('A')
      expect(response.body).to include('B')
      expect(response.body).to include('D')
      expect(response.body).to include('25')
    end
    it 'search invalid params return error' do
      get :search, { map: nil, origin: 'A', destination: 'D' }, valid_session
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end
