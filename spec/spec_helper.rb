RSpec.configure do |config|
  config.fail_fast = true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.profile_examples = 10
  config.order = :defined
  Kernel.srand config.seed

end
