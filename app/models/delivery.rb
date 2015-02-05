class Delivery
  attr_reader :map, :origin, :destination, :efficiency, :cost
  def initialize(options, map)
    @origin = options[:origin]
    @destination = options[:destination]
    @efficiency = options[:efficiency]
    @cost = options[:cost]
    @map = map
  end

  def best_route
    routes = []
    map.routes.each do |route|
      routes << [route.origin, route.destination, route.distance.round]
    end
    Graph.new(routes).shortest_path(origin, destination)
  end

  def calculate_cost(distance)
    return nil if distance.nil? || efficiency.nil? || cost.nil?
    (distance.to_f / efficiency.to_f) * cost.to_f
  end
end