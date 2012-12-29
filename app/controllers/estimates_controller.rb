class EstimatesController < ApplicationController
  before_filter :find_estimate, :only => [:update, :destroy, :show, :import, :export]

  def create
    @estimate = Estimate.create(params[:estimate])
  end

  def destroy
    @estimate.destroy
  end

  def show
    @features = @estimate.features
  end

  def import
    @features = @estimate.import(params[:estimate][:import])
  end

  def export
    csv_string = @estimate.export
    send_data csv_string, :filename => "#{@estimate.title} #{@estimate.updated_at}.csv"
  end

  private

  def find_estimate
    @estimate = Estimate.find_by_id(params[:id] || params[:estimate_id]) || not_found
  end
end
