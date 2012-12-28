class LinksController < ApplicationController
  before_filter :find_link, :only => [:update, :destroy]

  def create
    @link = Link.create(params[:link])
  end

  def destroy
    @link.destroy
  end

  private

  def find_link
    @link = Link.find_by_id(params[:id]) || not_found
  end
end
