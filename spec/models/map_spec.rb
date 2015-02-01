require 'rails_helper'

describe Map do
  describe 'instantiation' do
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
  end
end
