require 'rails_helper'

Describe Book do
  it 'has a name' do
    Book.create(:name => "Half of a Yellow Sun")
  end
end