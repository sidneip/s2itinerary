class Api::V1::MapsController < ApplicationController
  before_filter :map_params, only: [:create]
  def create
    @map = Map.create!(map_params)
    if @map.errors.empty?
      render json: @map.to_json(except: :id), status: :ok
    else
      render json: { errors: @map.errors.full_messages }, status: 422
    end
  end

  private

  def map_params
    params.require(:map).permit(:name)
  end
end