require 'rails_helper'

describe Route do
  let!(:route) { build(:route) }
  context 'valid' do
    it 'instantiates a map' do
      expect(route.class.name).to eq('Route')
    end
    it 'is valid route' do
      expect(route.valid?).to be true
    end
  end
  context 'invalid' do
    it 'without a origin' do
      route_invalid = Route.new(origin: nil)
      route_invalid.valid?
      expect(route_invalid.errors[:origin].size).to eq(1)
    end
    it 'without a destination' do
      route_invalid = Route.new(destination: nil)
      route_invalid.valid?
      expect(route_invalid.errors[:destination].size).to eq(1)
    end
    it 'without a distance' do
      route_invalid = Route.new(distance: nil)
      route_invalid.valid?
      expect(route_invalid.errors[:distance].size).to eq(2)
    end
    it 'without a map' do
      route.map = nil
      route.valid?
      expect(route.errors[:map].size).to eq(1)
    end
    it 'negative distance' do
      route.distance = -1
      route.valid?
      expect(route.errors[:distance].size).to eq(1)
    end
  end
end
