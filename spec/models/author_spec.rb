require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'has a name and a description' do
    expect {Author.create(:name => "Chimamanda Ngozi Adichie")}.to_not raise_error
  end
end
