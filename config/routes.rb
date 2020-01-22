Rails.application.routes.draw do
  resources :card_relationships
  resources :campaigns, only:[:create, :show, :index, :destroy]
  resources :cards, only:[:index, :show, :create, :destroy]
  resources :users, only:[:index, :show, :create]

  post "login", to: "authentication#login" 
  post "campaign_cards", to: "cards#campaign_cards"
  post "show_card", to: "cards#show_card"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
