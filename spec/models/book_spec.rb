require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:library) {Library.create(:name => "Brooklyn Public Library", :address => "431 6th Ave, Brooklyn, NY 11215")}

  let(:book) {Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")}

  let(:book_libraries_collection) { book.libraries << library}

  it 'has a title' do
    expect(book.title).to eq("Half of a Yellow Sun")
  end

  it "has a description" do
  expect(book.description).to eq("With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")
  end

  describe "relationship to author" do
    it "responds to author_books method" do
      expect(book).to respond_to(:author_books)
    end

    it "responds to authors method" do
      expect(book).to respond_to(:authors)
    end
  end

  describe "relationship to genre" do
    it "responds to genre" do
      expect(book).to respond_to(:book_genres)
    end

    it "responds to genres" do
    expect(book).to respond_to(:genre)
    end
  end

  describe "relationship to library" do
    it "responds to libraries method" do
      expect(book_libraries_collection).to include(library)
    end
  end

  describe "relationship to checkout" do
    it "responds to checkouts" do
      expect(book).to respond_to(:checkouts)
    end
  end
end