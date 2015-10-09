require 'rails_helper'

RSpec.describe Library, type: :model do
  let(:library) {Library.create(:name => "Brooklyn Public Library", :address => "431 6th Ave, Brooklyn, NY 11215")}

  it "has a name" do
    expect(library.name).to eq("Brooklyn Public Library")
  end

  it "has a name" do
    expect(library.address).to eq( "431 6th Ave, Brooklyn, NY 11215")
  end

  context "relationship to books" do
    it "has lots of books" do
      expect(library).to respond_to(:books)
    end
  end
end
