# frozen_string_literal: true

require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test 'notify admin' do
    email = ContactMailer.notify_admin(contacts(:one))
    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['from@example.com'], email.from
    assert_equal ['admin@example.com'], email.to
    assert_equal 'Someone has contacted you', email.subject
  end
end
