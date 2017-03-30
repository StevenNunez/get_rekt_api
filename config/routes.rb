Rails.application.routes.draw do
  namespace :v1 do
    resources :cocktails, only: [:index, :show]
  end
end
