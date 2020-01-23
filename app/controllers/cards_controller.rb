class CardsController < ApplicationController
  before_action :authenticate, only: [:create, :index, :campaign_cards, :show_card, :destroy, :update]
  
  def create   
      card = Card.create(user_params)
      render json: card
  end

  def destroy
    card = Card.find do |card|
      card.id == params[:id].to_i && card.user.id == @user.id
      
    end
    card.destroy
  end

  def index
    cards = Card.select do |card|
      card.user.id == @user.id
    end
    render json: cards, include: ["parentCards", "childCards"]
  end

  def show_card
    card = Card.find do |card|
      card.id == params[:card][:card_id].to_i && card.user.id == @user.id
    end
    render json:card, include: ["parentCards", "childCards"]
  end

  def campaign_cards
    campaign_cards = Card.select do |card|
      card.campaign_id == params[:card][:campaign_id].to_i && card.user_id == @user.id  
    end
    render json: campaign_cards
  end

  private

  def user_params
    params.require("card").permit(:card_id, :campaign_id, :name, :short_description, :text, :image).merge(user: @user)
  end
end
