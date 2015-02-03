class Api::V1::MapsController < ApplicationController
  before_filter :map_params, only: [:create]

  def show
    @map = Map.find_by(name: params[:name])
    raise ActiveRecord::RecordNotFound unless @map.present?
  end

  def create
    @map = Map.create!(map_params)
    if @map.errors.empty?
      render json: @map.to_json(except: :id), status: :ok
    else
      render json: { errors: @map.errors.full_messages }, status: 422
    end
  end

  def destroy
    @map = Map.find_by(name: params[:name])
    raise ActiveRecord::RecordNotFound unless @map.present?
    @map.destroy
    head :no_content
  end

  private

  def map_params
    params.require(:map).permit(:name)
  end
end