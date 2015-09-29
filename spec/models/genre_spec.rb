require 'rails_helper'

RSpec.describe Genre, type: :model do
  it 'has a name and a description' do
    expect {Genre.create(:name => "Fiction")}.to_not raise_error
  end
end
