Rails.application.routes.draw do
  namespace :v1 do
    resources :cocktails, only: [:index, :show]
    resources :sessions, only: [:create]
    resources :registrations, only: [:create]
  end
end
