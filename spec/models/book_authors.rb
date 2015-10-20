require 'rails_helper'

RSpec.describe BookAuthors, type: :model do
  let(:author) {Author.create(:name => "Chimamanda Ngozi Adichie")}

  let(:book) {Book.create(:title => "Half of a Yellow Sun", :description => "With effortless grace, celebrated author Chimamanda Ngozi Adichie illuminates a seminal moment in modern African history: Biafra's impassioned struggle to establish an independent republic in southeastern Nigeria during the late 1960s.")}

  let(:book_autors) { BookAuthors.create(:book_id => book.id, :author_id => author.id)}

  describe "connection to book model" do
    it "responds to book method" do
      expect(book_autors).to respond_to(:book)
    end
  end

  describe "connection to author model" do
    it "responds to books method" do
      expect(book_autors).to respond_to(:author)
    end
  end
end