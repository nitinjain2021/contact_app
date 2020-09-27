# frozen_string_literal: true

class NotifyAdminJob < ApplicationJob
  queue_as :default

  def perform(id)
    ContactMailer.notify_admin(Contact.find(id)).deliver_now
  end
end
