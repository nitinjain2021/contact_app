# frozen_string_literal: true

require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test 'notify admin' do
    # Create the email and store it for further assertions
    email = ContactMailer.notify_admin(contacts(:one))

    # Send the email, then test that it got queued
    assert_emails 1 do
      email.deliver_now
    end

    # Test the body of the sent email contains what we expect it to
    assert_equal ['from@example.com'], email.from
    assert_equal ['admin@example.com'], email.to
    assert_equal 'Someone has contacted you', email.subject
    # assert_equal read_fixture('invite').join, email.body.to_s
  end
end
