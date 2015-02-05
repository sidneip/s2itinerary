class Api::V1::DeliveriesController < ApplicationController
  before_filter :check_param
  def search
    @map = Map.find_by(name: params[:map])
    render json: { errors: 'not found' }, status: :not_found unless @map.present?
    delivery = Delivery.new(params, @map)
    best_route, distance = delivery.best_route
    cost = delivery.calculate_cost(distance)
    render json: { route: best_route, distance: distance, cost: cost}, status: :ok
  end

  private

  def check_param
    message = 'map, origin, destination is required'
    render json: {error: message}, status: 422 if params[:map].nil? || params[:origin].nil? || params[:destination].nil?
  end

end