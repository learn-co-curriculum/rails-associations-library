require 'rails_helper'

RSpec.describe Checkout, type: :model do
  it 'has a name and a description' do
    expect {Checkout.create(:start_date => "2015-09-25", :date_returned => "2015-09-30")}.to_not raise_error
  end
end
