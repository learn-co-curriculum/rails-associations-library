require 'rails_helper'

RSpec.describe LibraryBook, type: :model do
  let(:book) {Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s." )}

  let(:library) {Library.create(:name => "Brooklyn Public Library", :address => "431 6th Ave, Brooklyn, NY 11215")}

  let(:library_book) {LibraryBook.create(:book_id => book.id, :library_id => library.id)}

  describe "connection to book model" do
    it "responds to book method" do
      expect(library_book).to respond_to(:book)
    end
  end

  describe "connection to library model" do
    it "responds to library method" do
      expect(library_book).to respond_to(:library)
    end
  end
end
