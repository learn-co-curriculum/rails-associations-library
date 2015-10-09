require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) {Member.create(:name => "Uzo Aduba")}

  it "has a name" do
    expect(member).to respond_to(:name)
  end

  context "relation to county" do
    it "responds to counties method" do
      expect(member).to respond_to(:counties)
    end
  end
end
