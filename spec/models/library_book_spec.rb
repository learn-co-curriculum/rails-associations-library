require 'rails_helper'

RSpec.describe LibraryBook, type: :model do
  let(:library_book) {LibraryBook.create(book_id:1, library_id:1)}

  it "responds to book_id" do
    expect(:library_book.book_id).to eq(1)
  end
end
