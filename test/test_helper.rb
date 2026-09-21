ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# Add Devise test helpers to Integration / Controller tests
class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end

# Custom base class for tests that REQUIRE a logged-in user
class AuthenticatedIntegrationTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one) # Uses your default user fixture
    sign_in @user
  end
end
