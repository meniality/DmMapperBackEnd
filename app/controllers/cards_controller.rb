class CardsController < ApplicationController
  def create
    card = Card.create(user_params)

    render json: card
  end

  def index
    cards = Card.all 
    render json: cards
  end


  private

  def user_params
    params.require("card").permit(:name, :short_description, :text, :user_id)
  end
end
