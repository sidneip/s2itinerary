class Map < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :routes

  def best_route(origin, destination)
    routes = []
    Map.last.routes.each do |route|
      routes << [route.origin, route.destination, route.distance.round]
    end
    Graph.new(routes).shortest_path(origin, destination)
  end

  def calculate_cost(distance, efficiency, cost_gas)
    return nil if distance.nil? || efficiency.nil? || cost_gas.nil?
    (distance.to_f / efficiency.to_f) * cost_gas.to_f
  end
end
