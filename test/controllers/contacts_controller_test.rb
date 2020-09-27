# frozen_string_literal: true

require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test 'should get contact new' do
    get root_url

    assert_response :success
  end

  test 'should create contact' do
    assert_difference('Contact.count', +1) do
      post '/contacts', params: { contact: { first_name: 'NJ', last_name: 'DJ', email: 'nj@example.com', message: 'this is message' } }
    end

    assert_redirected_to root_url

    assert_equal 'Form Submitted.', flash[:notice]
  end

  test 'should not create contact' do
    assert_difference('Contact.count', 0) do
      post '/contacts', params: { contact: { first_name: 'Nj' } }
    end

    assert_response :success

    assert_not_nil flash[:alert]
  end
end
