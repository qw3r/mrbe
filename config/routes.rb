Rails.application.routes.draw do
  resources :dogs, expect: [:new, :edit], defaults: {format: 'json'} do
    resources :tricks, expect: [:new, :edit], shallow: true
  end

  get '/health-check', to: 'application#health_check'

  match '*unknown_route', to: 'application#unknown_route', via: :all

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
