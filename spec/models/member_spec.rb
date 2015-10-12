require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) {Member.create(:name => "Uzo Aduba")}

  it "has a name" do
    expect(member).to respond_to(:name)
  end

  describe "relation to county" do
    it "responds to counties method" do
      expect(member).to respond_to(:counties)
    end
  end

  describe "relation to library" do
    it "responds to libraries method" do
      expect(member).to respond_to(:libraries)
    end
  end

  describe "relation to checkout" do
    it "responds to checkouts method" do
      expect(member).to respond_to(:checkouts)
    end
  end

  describe "relation to books" do
    it "responds to books method" do
      expect(member).to respond_to(:books)
    end
  end
end
