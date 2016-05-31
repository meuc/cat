Rails.application.routes.draw do
  get 'audios/show'

  root to: "welcome#index"
  
  resources :cats, only: [:index, :show] do
    resource :audio, only: [:show]
    resources :reservations, only: [:create, :new]
    resources :open_slots, only: [:show], param: :date
  end
  
  namespace :admin do
    resources :reservations, only: [:index]
    resources :cats, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  
  get "/admin", to: "admin/dashboards#index"
end
