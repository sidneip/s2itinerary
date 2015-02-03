json.map params[:map]
json.route do |route|
  json.origin @route.origin
  json.destination @route.destination
  json.distance @route.distance
end