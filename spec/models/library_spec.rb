require 'rails_helper'

RSpec.describe Library, type: :model do
  let(:library) {Library.create(:name => "Brooklyn Public Library", :address => "431 6th Ave, Brooklyn, NY 11215")}

  it "has a name" do
    expect(library.name).to eq("Brooklyn Public Library")
  end

  it "has an address" do
    expect(library.address).to eq( "431 6th Ave, Brooklyn, NY 11215")
  end

  describe "connection to book model" do
    it "responds to books method" do
      expect(library).to respond_to(:books)
    end
  end

  describe "connection to county model" do
    it "responds to countries method" do
      expect(library).to respond_to(:county)
    end
  end
end
