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

  context "relation to library" do
    it "responds to libraries method" do
      expect(member).to respond_to(:libraries)
    end
  end
end
