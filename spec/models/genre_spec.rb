require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(:genre) {Genre.create(:name => "Fiction")}

  describe "its attributes" do
    it "has a name" do
      expect(genre.name).to eq("Fiction")
    end
  end

  describe "connection to book_genre model" do
    it "responds to book_genres method" do
      expect(genre).to respond_to(:book_genres)
    end
  end

  describe "connection to book model" do
    it "responds to books method" do
      expect(genre).to respond_to(:books)
    end
  end
end
