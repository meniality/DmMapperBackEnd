class CardRelationshipsController < ApplicationController
  before_action :authenticate, only: [:create, :index]
  def index
    all = CardRelationship.all

    render json: all
  end

  def create
    newRelationship = CardRelationship.create(card_relationship_params)
    render json: newRelationship, include: ["parent_card", "child_card"]
  end

  private

  def card_relationship_params
    params.require("card_relationships").permit(:parent_card_id, :child_card_id)
  end
end
