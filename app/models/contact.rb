# frozen_string_literal: true

class Contact < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :first_name, :last_name, :email, :message, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }
  after_commit :notify_admin, on: :create

  private

  def notify_admin
    NotifyAdminJob.perform_later id
  end
end
