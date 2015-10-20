require 'rails_helper'

RSpec.describe GenreBook, type: :model do
  let(:book) {Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")}

  let(:genre) {Genre.create(:name => "Fiction")}

   let(:genre_book) {GenreBook.create(:book_id => book.id, :genre_id => genre.id)}

  describe "connection to book model" do
    it "responds to books method" do
      expect(genre_book).to respond_to(:book)
    end
  end

  describe "connection to genre model" do
    it "responds to genres method" do
      expect(genre_book).to respond_to(:genre)
    end
  end
end