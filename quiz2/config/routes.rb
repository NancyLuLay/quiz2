Rails.application.routes.draw do

  root "requests#index"
  resources :requests
  get '/requests/flop/:id' => 'requests#flop', as: :request_flop

end
