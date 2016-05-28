Rails.application.routes.draw do
  root to: "welcome#index"
  
  resources :cats do 
    resources :reservations, only: [:create, :new]
    resources :open_slots, only: [:show], param: :date
  end
end
