class ContactsController < ApplicationController
  before_filter :find_contact, :only => [:update, :destroy]

  def create
    @contact = Contact.create(params[:contact])
  end

  def update
    @contact.update_attributes({:state => params[:state]})
  end

  def destroy
    @contact.destroy
  end

  private

  def find_contact
    @contact = Contact.find_by_id(params[:id]) || not_found
  end
end
