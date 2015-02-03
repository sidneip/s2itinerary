require 'rails_helper'

RSpec.describe Api::V1::RoutesController, type: :routing do
  it 'route post routes#create' do
    expect(:post => 'v1/route').to route_to('api/v1/routes#create', :format => "json")
  end
end