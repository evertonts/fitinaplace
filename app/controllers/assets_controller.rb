class AssetsController < ApplicationController
  def create
    @asset = Asset.new(params[:asset])
    @asset.resource_id = params[:resource_id]
    @asset.save
    redirect_to :back
  end
end
