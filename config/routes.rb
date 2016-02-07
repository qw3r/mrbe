Rails.application.routes.draw do
  resources :dogs, expect: [:new, :edit], defaults: {format: 'json'}

  match '*unknown_route', to: 'application#unknown_route', via: :all

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
