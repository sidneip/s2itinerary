class Api::V1::DeliveriesController < ApplicationController
  before_filter :check_param
  def search
    @map = Map.find_by(name: params[:map])
    render json: { errors: 'not found' }, status: :not_found unless @map.present?
    best_route, distance = @map.best_route(params[:origin], params[:destination])
    render json: { route: best_route, distance: distance}, status: :ok
  end

  private

  def check_param
    message = 'map, origin, destination is required'
    render json: {error: message}, status: 422 if params[:map].nil? || params[:origin].nil? || params[:destination].nil?
  end

end