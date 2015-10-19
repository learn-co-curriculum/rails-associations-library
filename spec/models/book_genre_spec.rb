require 'rails_helper'

RSpec.describe BookGenre, type: :model do
  let(:book) {Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")}

  let(:genre) {Genre.create(:name => "Fiction")}

   let(:book_genre) {BookGenre.create(:book_id => book.id, :genre_id => genre.id)}

  describe "relationship to book" do
    it "responds to book_id" do
      expect(library_book.book_id).to eq(book.id)
    end
  end

  describe "relationship to genre" do
    it "responds to genre_id" do
      expect(book_genre.genre_id).to eq(genre.id)
    end
  end
end