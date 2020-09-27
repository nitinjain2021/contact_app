# frozen_string_literal: true

require 'test_helper'

class NotifyAdminJobTest < ActiveJob::TestCase
  include ActionMailer::TestHelper

  test 'that email is sent after processing' do
    assert_emails 0

    NotifyAdminJob.perform_now(contacts(:one).id)

    assert_emails 1
  end
end
