require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) {Member.create(:name => "Uzo Aduba")}

  it "has a name" do
    expect(member).to respond_to(:name)
  end

  describe "connection to county model" do
    it "responds to counties method" do
      expect(member).to respond_to(:counties)
    end
  end

  describe "connection to library model" do
    it "responds to libraries method" do
      expect(member).to respond_to(:libraries)
    end
  end

  describe "connection to checkout model" do
    it "responds to checkouts method" do
      expect(member).to respond_to(:checkouts)
    end
  end

  describe "connection to book model" do
    it "responds to books method" do
      expect(member).to respond_to(:books)
    end
  end
end
