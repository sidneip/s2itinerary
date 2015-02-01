FactoryGirl.define do
  factory :route do
    origin 'A'
    destination 'B'
    distance '10'
    association :map, factory: :map
  end
end
