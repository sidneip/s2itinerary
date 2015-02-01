require 'rails_helper'

RSpec.describe 'Maps', :type => :request do
  let!(:map) { build(:map) }
  describe 'valid' do
    it 'post v1/map' do
      post api_v1_maps_create_path( {map:{name: 'Araraquara'}} )
      expect(response.status).to eq 200
    end
    it 'post v1/map' do
      post api_v1_maps_create_path( {map:{name: 'Sao Paulo'}} )
      expect(response.body.include?('Sao Paulo')).to be true
    end
  end
  describe 'invalid' do
    it 'post v1/map invalid param' do
      post api_v1_maps_create_path({ name: 'Araraquara' })
      expect(response.status).to eq 422
    end
  end
end