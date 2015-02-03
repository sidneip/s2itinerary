class Api::V1::RoutesController < ApplicationController
  before_filter :route_params, only: [:create]

  def show
    @map = Map.where(name: params[:map]).select(:id).take
    fail ActiveRecord::RecordNotFound unless @map.present?
    @route = Route.where(search_params).take
    fail ActiveRecord::RecordNotFound unless @route.present?
  end

  def create
    @map = Map.find_by(name: params[:route][:map])
    raise ActiveRecord::RecordNotFound unless @map.present?
    @route = @map.routes.create(origin: params[:route][:origin], destination: params[:route][:destination], distance: params[:route][:distance])
    if @route.errors.empty?
      render json: @route.to_json(except:[:id, :map_id], include: { map: { only: :name } }), status: :ok
    else
      render json: { errors: @route.errors.full_messages }, status: 422
    end
  end

  private

  def route_params
    params.require(:route).permit(:origin, :destination, :distance, :map)
  end

  def search_params
    { map_id:@map.id, origin: params[:origin], destination: params[:destination] }
  end
end
