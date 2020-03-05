class CardRelationshipsController < ApplicationController
  before_action :authenticate
  def index
    all = CardRelationship.all

    render json: all
  end

  def create
    
    newRelationship = CardRelationship.create(card_relationship_params)
    render json: newRelationship, include: ["parent_card", "child_card"]
  end

  def destroy_relationship
    currentCardRelationship = CardRelationship.find do |relationship|
      
      relationship.parent_card_id == params[:card_relationships][:parent_card_id].to_i && relationship.child_card_id == params[:card_relationships][:child_card_id].to_i
    end
    currentCardRelationship.destroy
  end

  private

  def card_relationship_params
    params.require("card_relationships").permit(:parent_card_id, :child_card_id)
  end
end
