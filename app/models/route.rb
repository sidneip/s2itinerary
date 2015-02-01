class Route < ActiveRecord::Base
  belongs_to :map
  validates :origin, :destination, :distance, :map, presence: true
  validates :distance, numericality: { greater_than: 0 }
  validates :origin, uniqueness: { scope: [:destination, :map_id] }
end
