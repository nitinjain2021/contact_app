# frozen_string_literal: true

require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  include ActiveJob::TestHelper

  def setup
    @contact = contacts(:one)
  end

  test 'valid user' do
    assert @contact.valid?
  end

  test 'invalid without first name ,last name, email and message' do
    contact = contacts(:invalid)
    refute contact.valid?, 'saved user without first name ,last name, email and message'
    assert_not_nil contact.errors[:first_name], 'no validation error for first name present'
    assert_not_nil contact.errors[:last_name], 'no validation error for last name present'
    assert_not_nil contact.errors[:email], 'no validation error for email present'
    assert_not_nil contact.errors[:message], 'no validation error for email present'
  end

  test 'invalid email format' do
    @contact.email = 'sdf'
    refute @contact.valid?
    assert_not_nil @contact.errors[:email]
  end

  test 'after creation job for NotifyAdmin get enqueued' do
    assert_enqueued_jobs 0
    contact = Contact.create(first_name: 'NJ', last_name: 'Tz',
                             email: 'xyz@yopmail.com', message: 'Message sentence')
    assert_enqueued_with(job: NotifyAdminJob, args: [contact.id], queue: 'default')
    assert_enqueued_jobs 1
  end
end
