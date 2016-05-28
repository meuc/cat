Rails.application.routes.draw do
  root to: "welcome#index"
  
  resources :cats do 
    resources :reservations, only: [:create, :new]
  end
end
