class FeaturesController < ApplicationController
  before_filter :find_feature, :only => [:update, :destroy, :show, :update]

  def create
    @feature = Feature.create(params[:feature])
  end

  def destroy
    @feature.destroy
  end

  def show
    @efforts = @feature.efforts
  end

  def update
    @feature.update_attributes(
      {
        :optimistic => params[:optimistic],
        :most_likely => params[:most_likely],
        :pessimistic => params[:pessimistic]
      })
    render :json => @feature
  end

  private

  def find_feature
    @feature = Feature.find_by_id(params[:id]) || not_found
  end
end
