class CardsController < ApplicationController
  before_action :authenticate, only: [:create, :index, :campaign_cards, :show_card, :destroy, :update_card]
  
  def create   
      card = Card.create(card_params)
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

  def update_card
    foundCard = Card.find do |card|
      card.id == params[:card][:id].to_i && card.user.id == @user.id
    end
    
    foundCard.update(card_params)
    render json: foundCard
  end
  private

  def card_params
    params.require("card").permit(:id, :campaign_id, :name, :short_description, :text, :image).merge(user: @user)
  end
end
