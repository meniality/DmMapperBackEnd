Rails.application.routes.draw do
  resources :campaigns, only:[:create, :show, :index]
  resources :cards, only:[:index, :show, :create]
  resources :users, only:[:index, :show, :create]

  post "login", to: "authentication#login" 
  post "campaign_cards", to: "cards#campaign_cards"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
