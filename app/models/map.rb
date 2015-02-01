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
end
