Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json}  do
    namespace :v1 do
      resources :expenses, :only => [:index, :create, :update, :destroy]
    end
  end
  root 'dashboards#index'
  resources :expenses, only: [:index, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


