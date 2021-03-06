require 'rails_helper'

describe Map do
  context 'validations' do
    let!(:map) { build(:map) }
    it 'instantiates a map' do
      expect(map.class.name).to eq('Map')
    end
    it 'is valid map' do
      expect(map.valid?).to be true
    end
    it 'is invalid without a name' do
      map_invalid = Map.new(name: nil)
      map_invalid.valid?
      expect(map_invalid.errors[:name]).to include("can't be blank")
    end
    it 'is invalid with duplicate name' do
      map.save!
      map_new = Map.create(name: 'Araraquara')
      expect(map_new.errors[:name]).to include('has already been taken')
    end
    it 'call method best route' do
      map.save!
      map.routes.create(origin: 'A', destination: 'B', distance: 10)
      map.routes.create(origin: 'B', destination: 'D', distance: 15)
      map.routes.create(origin: 'A', destination: 'C', distance: 20)
      map.routes.create(origin: 'C', destination: 'D', distance: 30)
      map.routes.create(origin: 'B', destination: 'E', distance: 50)
      map.routes.create(origin: 'D', destination: 'E', distance: 30)
      params = {origin: 'A', destination: 'D'}
      best_route = Delivery.new(params, map).best_route
      expect(best_route).to eq [['A', 'B', 'D'], 25]
    end
    it 'method calculate cost' do
      map.save!
      map.routes.create(origin: 'A', destination: 'B', distance: 10)
      map.routes.create(origin: 'B', destination: 'D', distance: 15)
      map.routes.create(origin: 'A', destination: 'C', distance: 20)
      map.routes.create(origin: 'C', destination: 'D', distance: 30)
      map.routes.create(origin: 'B', destination: 'E', distance: 50)
      map.routes.create(origin: 'D', destination: 'E', distance: 30)
      params = {origin: 'A', destination: 'D', efficiency: 10, cost:2.50}
      delivery = Delivery.new(params, map)
      cost = delivery.calculate_cost(25)
      expect(cost).to eq 6.25
    end
    it 'method calculate cost params nil' do
      params = {origin: 'A', destination: 'D', efficiency: 10, cost:2.50}
      delivery = Delivery.new(params, map)
      cost = delivery.calculate_cost(nil)
      expect(cost).to eq nil
    end
  end
end
