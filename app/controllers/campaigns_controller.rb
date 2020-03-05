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

  def destroy
    currentCampaign = Campaign.find do |campaign|
      campaign.id == params[:id].to_i && campaign.user.id == @user.id
    end
    currentCampaign.destroy
  end

  private

  def campaign_params
    params.require("campaign").permit(:name).merge(user: @user)
  end
end
