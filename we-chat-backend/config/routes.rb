Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :update]
    end
  end
end
end
