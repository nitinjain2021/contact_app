# frozen_string_literal: true

class ContactMailer < ApplicationMailer
  def  notify_admin(contact)
    @contact = contact
    mail(to: 'admin@example.com', subject: 'Someone has contacted you')
  end
end
