class CardRelationshipsController < ApplicationController
  def index
    all = CardRelationship.all

    render json: all
  end

  def create
    newRelationship = CardRelationship.create(parent_card_id: params[:parent_card_id], child_card_id: params[:child_card_id])
    

    render json: newRelationship
  end

end
