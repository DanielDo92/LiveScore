Rails.application.routes.draw do
  namespace :api do
    resources :scores, only: %w(create) do
      collection do
        post :update_score
      end
    end
  end
  root to: 'scores#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
