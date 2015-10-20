require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(:genre) {Genre.create(:name => "Fiction")}

  describe "its attributes" do
    it "has a name" do
      expect(genre.name).to eq("Fiction")
    end
  end

  describe "connection to book model" do
      it "responds to genre_books method" do
        expect(book).to respond_to(:genre_books)
      end

      it "responds to books method" do
        expect(book).to respond_to(:books)
      end
  end
end
