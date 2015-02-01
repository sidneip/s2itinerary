require 'rails_helper'

RSpec.describe Api::V1::MapsController, type: :routing do
  it 'route post maps#create' do
    expect(:post => 'v1/map').to route_to('api/v1/maps#create')
  end
end