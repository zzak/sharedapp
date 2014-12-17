ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

# Since we're using in memory sqlite, migrate database before loading test_help
# Otherwise, test_help will raise ActiveRecord::PendingMigrationError
ActiveRecord::Tasks::DatabaseTasks.migrate
# Now load rails test setup
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
