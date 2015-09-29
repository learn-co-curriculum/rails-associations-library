require 'rails_helper'

RSpec.describe Library, type: :model do
  it 'has a name and a description' do
    expect {Library.create(:name => "Brooklyn Public Library", :address => "431 6th Ave, Brooklyn, NY 11215")}.to_not raise_error
  end
end
