FactoryGirl.define do
  factory :route do
    origin 'A'
    destination 'B'
    distance '10'
    association :map, factory: :map
  end

  factory :route2 do
    origin 'B'
    destination 'D'
    distance '15'
    association :map, factory: :map
  end

  factory :route3 do
    origin 'A'
    destination 'C'
    distance '20'
    association :map, factory: :map
  end

  factory :route4 do
    origin 'C'
    destination 'D'
    distance '30'
    association :map, factory: :map
  end

  factory :route5 do
    origin 'B'
    destination 'E'
    distance '50'
    association :map, factory: :map
  end

  factory :route6 do
    origin 'D'
    destination 'E'
    distance '30'
    association :map, factory: :map
  end
end
