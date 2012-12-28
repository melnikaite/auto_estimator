class AttachmentsController < ApplicationController
  before_filter :find_attachment, :only => [:update, :destroy, :show]

  def create
    uploaded_io = params[:attachment][:file_name]
    params[:attachment][:file_name] = uploaded_io.original_filename
    @attachment = Attachment.create(params[:attachment])
    File.open(Rails.root.join('public', 'uploads', @attachment.id.to_s), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def update
    @attachment.update_attributes({:state => params[:state]})
  end

  def destroy
    begin
      File.unlink(Rails.root.join('public', 'uploads', @attachment.id.to_s))
    rescue
    end
    @attachment.destroy
  end

  def show
    send_file Rails.root.join('public', 'uploads', @attachment.id.to_s).to_s, :filename => @attachment.file_name
  end

  private

  def find_attachment
    @attachment = Attachment.find_by_id(params[:id]) || not_found
  end
end
