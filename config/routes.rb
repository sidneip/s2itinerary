Rails.application.routes.draw do
  namespace :api, path: '', format: 'json' do
    namespace 'v1' do
      #map
      get  "/map/:name" => 'maps#show', as: :maps_show
      post 'map' => 'maps#create', as: :maps_create
      delete '/map/:name' => 'maps#destroy', as: :maps_delete
      #route
      get  'route' => "routes#show", as: :routes_show
      post 'route' => 'routes#create', as: :routes_create
      #delivery
      get 'delivery' => 'deliveries#search', as: :deliveries_search
    end
  end
end
