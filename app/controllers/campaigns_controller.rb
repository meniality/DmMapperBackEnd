class CampaignsController < ApplicationController
  before_action :authenticate
  def create
    newCampaign = Campaign.create(campaign_params)
    render json: newCampaign
  end

  def index
    campaigns = Campaign.select do |campaign|  
      campaign.user_id == @user.id
    end
    render json: campaigns
  end

  private

  def campaign_params
    params.require("campaign").permit(:name,).merge(user: @user)
  end
end
