require 'rails_helper'

RSpec.describe County, type: :model do
  it 'has a name and a description' do
    expect {County.create(:name => "Kings County")}.to_not raise_error
  end
end
