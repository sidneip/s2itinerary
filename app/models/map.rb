class Map < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :routes, dependent: :destroy
end
