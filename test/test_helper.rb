require 'simplecov'

SimpleCov.start 'rails' do
  add_group "Services", "app/services"
  add_group "Policies", "app/policies"

  add_filter "app/channels"
  add_filter "app/jobs/application_job"
  add_filter "app/policies/application_policy"
  add_filter "app/controllers/errors_controller"
  add_filter "app/mailers/application_mailer"
end

ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require 'minitest/unit'
require 'mocha/minitest'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  fixtures :all

  def login(user)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end

  def logout
    ApplicationController.any_instance.stubs(:current_user).returns nil
  end
end
