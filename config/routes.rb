Rails.application.routes.draw do
  resources :card_relationships, only:[:create, :index]
  resources :campaigns, only:[:create, :show, :index, :destroy]
  resources :cards, only:[:index, :show, :create, :destroy]
  resources :users, only:[:index, :show, :create]

  post "login", to: "authentication#login" 
  post "campaign_cards", to: "cards#campaign_cards"
  post "show_card", to: "cards#show_card"
  patch "update_card", to: "cards#update_card"
  post "destroy_relationship", to: "card_relationships#destroy_relationship"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
