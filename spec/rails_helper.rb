# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start

require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  def test_data

    @chef_1 = Chef.create!(name: "Alec")
    @chef_2 = Chef.create!(name: "Luna")

    @dish_1 = Dish.create!(name: 'Chicken Parm', description: 'Savor the flavor!', chef: @chef_1)
    @dish_2 = Dish.create!(name: 'BLT', description: 'Refreshing!', chef: @chef_1)
    @dish_3 = Dish.create!(name: 'Cheese Fries', description: 'Zesty!', chef: @chef_2)
    @dish_4 = Dish.create!(name: 'Taco', description: 'Super flavor!', chef: @chef_2)

    @ingredient_1 = Ingredient.create!(name: 'Chicken', calories: 50)
    @ingredient_2 = Ingredient.create!(name: 'Bacon', calories: 100)
    @ingredient_3 = Ingredient.create!(name: 'Lettuce', calories: 5)
    @ingredient_4 = Ingredient.create!(name: 'Tomato', calories: 10)
    @ingredient_5 = Ingredient.create!(name: 'Cheese', calories: 100)
    @ingredient_6 = Ingredient.create!(name: 'Potatoes', calories: 25)

    @dish_ingredient_1 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    @dish_ingredient_2 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_4)
    @dish_ingredient_3 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    @dish_ingredient_3 = DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_5)

    @dish_ingredient_5 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_1)
    @dish_ingredient_6 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
    @dish_ingredient_6 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_5)
    @dish_ingredient_7 = DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_6)

    @dish_ingredient_5 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_1)
    @dish_ingredient_6 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_4)
    @dish_ingredient_6 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_5)
    @dish_ingredient_7 = DishIngredient.create!(dish: @dish_3, ingredient: @ingredient_3)
    
    @dish_ingredient_5 = DishIngredient.create!(dish: @dish_4, ingredient: @ingredient_2)
    @dish_ingredient_6 = DishIngredient.create!(dish: @dish_4, ingredient: @ingredient_4)
    @dish_ingredient_6 = DishIngredient.create!(dish: @dish_4, ingredient: @ingredient_5)
    @dish_ingredient_7 = DishIngredient.create!(dish: @dish_4, ingredient: @ingredient_6)
  end
end
