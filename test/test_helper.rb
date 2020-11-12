ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post sessions_create_path, params: { session: { username: user.username,
                                                      password: password,
                                                      remember_me: remember_me } }
    else
      session[:user_id] = user.id
    end
  end

  def integration_test?
    defined?(follow_redirect!)
  end
end
