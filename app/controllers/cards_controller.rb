class CardsController < ApplicationController
  before_action :authenticate, only: [:create, :index]
  
  def create   
      card = Card.create(user_params)
      render json: {card: card}
  end

  def index
    cards = Card.all 
    render json: cards
  end

  private

  def user_params
    byebug
    params.require("card").permit(:name, :short_description, :text,).merge(user: @user)
    
  end
end
