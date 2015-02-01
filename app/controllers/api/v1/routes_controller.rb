class Api::V1::RoutesController < ApplicationController
  before_filter :route_params, only: [:create]

  def create
    @map = Map.find_by(name: params[:route][:map])
    render json: { errors: 'not found' }, status: :not_found unless @map.present?
    @route = @map.routes.create(origin: params[:route][:origin], destination: params[:route][:destination], distance: params[:route][:distance])
    if @route.errors.empty?
      render json: @route.to_json(except:[:id, :map_id], include: {map: {only: :name}}), status: :ok
    else
      render json: { errors: @route.errors.full_messages }, status: 422
    end
  end

  private

  def route_params
    params.require(:route).permit(:origin, :destination, :distance, :map)
  end
end
