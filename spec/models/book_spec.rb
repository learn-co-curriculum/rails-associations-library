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

  describe "connection to author model" do
      it "responds to book_authors method" do
        expect(book).to respond_to(:book_authors)
      end

      it "responds to authors method" do
        expect(book).to respond_to(:authors)
      end
  end

  describe "connection to genre model" do
      it "responds to genre_books method" do
        expect(book).to respond_to(:genre_books)
      end

      it "responds to genres method" do
        expect(book).to respond_to(:genres)
      end
  end

  describe "connection to library model" do
      it "responds to library_books method" do
        expect(book).to respond_to(:library_books)
      end

      it "responds to books method" do
        expect(book).to respond_to(:libraries)
      end
  end

  describe "connection to checkout model" do
    it "responds to checkouts method" do
      expect(book).to respond_to(:checkouts)
    end
  end
end