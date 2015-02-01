Rails.application.routes.draw do
  namespace :api, path: '' do
    namespace 'v1' do
      post 'map' => 'maps#create', as: :maps_create
      post 'route' => 'routes#create', as: :routes_create
    end
  end
end
