require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'has a name and a description' do
    expect {Member.create(:name => "Uzo Aduba")}.to_not raise_error
  end
end
