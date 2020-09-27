# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(create_params)
    if @contact.save
      flash[:notice] = 'Form Submitted.'
      redirect_to root_url
    else
      flash.now[:alert] = @contact.errors.full_messages.join(', ')
      render 'new'
    end
  end

  private

  def create_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone, :message)
  end
end
